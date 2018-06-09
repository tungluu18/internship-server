const partner = require('../model/partner');

module.exports = {
    commentForStudent: async function(req,res){
        try{
            let partnerId = await req.query.partnerId;
            let studentId = await req.query.studentId;
            let mark = await req.body.mark;
            let comment = await req.body.comment;
        
            if (parterId === undefined || studentId === undefined ){
                return res.send({error: "Chưa điền đầy đủ thông tin"});
            }
            if(comment === undefined || mark === undefined){
                console.log("sai comment")
                res.send({error: "Bạn chưa nhập đủ thông tin cho sinh viên"});
            }
            if (mark< 0 || mark > 10){
                console.log("sai ddiem");
                res.send({error: "Điểm phải nằm trong khoảng từ 0-10"});
            }
            
            await partner.addCommentAndMarkForStudent(partnerId, studentId, comment, mark).then(()=>{
                console.log("Ok")    
                res.send({success: true, 
                            error : null})
            })
        }
        catch (err){
            console.log("err")
            res.send(err.messenge); 
        }
    },
    seeProfileOfStudent: async function(req,res){
        try{
            let partnerId = await req.query.partnerId;
            console.log(partnerId)
            if (partnerId === undefined) return  res.send(404);

            // trả về profile sinh viên
            await partner.seeProfileOfStudent(partnerId).then(r =>{
                res.send(r);
            }); 
        }catch(err){
            res.send({success: false,
                     err: err.messenge});
        }
    }

}