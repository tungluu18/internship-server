const knex = require('knex')(require('../knexfile'));
const secure = require('../control/secure');
const storage = require('./storage')
const student = require('./student');
const utilize = require('./utilize')

module.exports = {  
  add: async function (username, password, type) {
    if (type !== 'student' && type !== 'admin' && type !== 'lecturer' && type !== 'partner')
      return Promise.reject(new Error('Loại tài khoản không hợp lệ'))
    try {
      const rows = await knex('user').select()
      const newId = utilize.findNewIndex(rows, 'id')
      for (let element of rows) if (element.username === username) return Promise.reject(new Error("Username đã tồn tại"))
      await knex('user').insert({
        'id': newId, 'type': type,
        'username': username, 'password': secure.encrypt(password)
      })
      await knex(`${type}`).insert({'id': newId})
      return Promise.resolve(newId)
    } catch (error) {
      return Promise.reject(err)
    }
  },

  deleteById: function (id) {
    return knex('user').where('id', id).delete()
  },

  getType: async function (id) {
    try {
      const result = await knex('user').where('id', id)
      if (result.length == 0) return Promise.reject(new Error("id không tồn tại"))
      return Promise.resolve(result[0].type)
    } catch (err) {
      return Promise.reject(new Error(err))
    }
  },

  getAvatar: async function (id) {
    try {
      const result = await knex(`user`).where('id', id)
      if (result.length == 0) return Promise.reject(new Error("id không tồn tại"))
      return Promise.resolve(result[0].avatar)
    } catch (err) {
      return Promise.reject(new Error(err))
    }
  },

  getName: async function (id) {
    try {
      const typeOfUser = await this.getType(id)
      const result = await knex(`${typeOfUser}`).where('id', id)
      if (result.length == 0) return Promise.reject(new Error("id không tồn tại"))
      return Promise.resolve(result[0].name)
    } catch (err) {
      return Promise.reject(new Error(err))
    }
  },

  getById: async function (id) {
    try {
      const result = await knex('user').where('id', id)
      if (result.length == 0) return Promise.reject(new Error("id không tồn tại"))
      return Promise.resolve(result[0])
    } catch (err) {
      return Promise.reject(err)
    }
  },

  getProfile: async function (id) {
    try {
      const type = await this.getType(id)
      let result = await knex(`${type}`).where('id', id)
      if (result.length == 0) return Promise.reject(new Error("id không tồn tại"))
      result[0].avatarLink = 'http://localhost:3000' + await this.getAvatar(id)
      // result[0][`${type}Id`] = result[0].id
      //result[0].id = undefined
      return Promise.resolve(result[0])
    } catch (err) {
      return Promise.reject(err)
    }
  },

  getByType: async function(type) {
    if (type != 'student' && type != 'partner' && type != 'lecturer' && type != 'admin')
      throw new Error('Truy vấn không hợp lệ')
    try {
      const result = await knex(type).select()
      for (e of result) e.avatarLink = 'http://localhost:3000' + await this.getAvatar(e.id)
        return Promise.resolve(result)
    } catch (err) {
      return Promise.reject(err)
    }
  },  

  update: async function (requesterId, id, info) {
    const studentFixed = ['name', 'mssv', 'class', 'khoa', 'nganh', 'diachi', 'ngaysinh', 'vnumail', 'GPA', 'namtotnghiep']
    const studentEditable = ['email', 'skypeID', 'facebook', 'phone', 'vitri', 'kynang', 'chungchi', 'kinhnghiem', 'sothich', 'dinhhuong', 'ghichu']
    //console.log(requesterId + ' ' + id)
    // console.log(info)
    try {
      const typeOfUser = await this.getType(id)
      const typeOfRequester = await this.getType(requesterId)
      if (typeOfUser == 'student' && typeOfRequester == 'student')
        for (p of studentFixed) info[p] = undefined
      info['id'] = id       //'info' rỗng khi chèn vào bảng sẽ báo lỗi 
      info.avatarLink = undefined
      await knex(`${typeOfUser}`).where('id', id).update(info)
      return Promise.resolve()
    } catch (err) {
      console.log(err.message)
      return Promise.reject(new Error("Thông tin không hợp lệ"))
    }
  },

  updateAvatar: async function (id, avatarLink) {
    const oldAvatarLink = await this.getAvatar(id)    
    if (oldAvatarLink != '/avatar/0.jpg') await storage.deleteFile(oldAvatarLink)    
    return knex('user').where('id', id).update({
      id: id, avatar: avatarLink
    })
  },

  updatePassword: async function (id, password) {
    return knex('user').where('id', id).update({password: secure.encrypt(password) })
  },

  sendMessage: async function(senderId, receiverId, replyTo, title, content) {
    try {
      if (senderId == receiverId) return Promise.reject(new Error('Không gửi thư được cho chính mình đâu bạn nhé'))
      const [senderExist, receiverExist, replyToExist] = await Promise.all([
        utilize.isExisted('user', {id: senderId}),
        utilize.isExisted('user', {id: receiverId}),
        utilize.isExisted('message', {messageId: replyTo})
      ])
      if (replyTo != null && !replyToExist) return Promise.reject(new Error("Thư được phản hồi không tồn tại trên hệ thống"))      
      if (!receiverExist || !senderExist) return Promise.reject(new Error('username không hợp lệ'))
      const allMessage = await knex('message').select('messageId')
      const newIndex = utilize.findNewIndex(allMessage, 'messageId')
      await knex('message').insert({        
        messageId: newIndex, senderId: senderId, receiverId: receiverId, replyTo: replyTo, title: title, content: content, seen: false
      })
    } catch (err) {
      return Promise.reject(err)
    }
  },
  
  getMessageByFilter: async function(requesterId, filter) {
    try {
      let allMessage = await knex('message')
                          .where('senderId', requesterId)
                          .orWhere('receiverId', requesterId)
                          .select()
      let afterFiltered = []
      if (filter == 'sent') 
        afterFiltered = allMessage.filter(e => e.senderId == requesterId)
      else if (filter == 'inbox') 
        afterFiltered = allMessage.filter(e => e.receiverId == requesterId)
      else if (filter == 'unseen') 
        afterFiltered = allMessage.filter(e => e.receiverId == requesterId && e.seen == false)    
      const result = await utilize.getSenderAndReceiverUsername(afterFiltered)
      return Promise.resolve(result)
    } catch (err) {
      return Promise.reject(err)
    }
  },

  receiveMessage: async function(requesterId, messageId) {
    try {
      const message = await utilize.getFirstElement('message', {messageId: messageId})      
      if (requesterId != message.senderId && requesterId != message.receiverId)
        return Promise.reject(new Error('Thư này không phải của bạn'))
      if (message.receiverId == requesterId) 
        await knex('message').where('messageId', messageId).update({'seen': 1})

      const [result] = await utilize.getSenderAndReceiverUsername([message])      
      return Promise.resolve(result)
    } catch (err) {
      return Promise.reject(err)
    }
  }
}