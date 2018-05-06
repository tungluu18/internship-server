
exports.up = function(knex, Promise) {
    return knex.schema.createTable('user', function(t) {
        t.increments('id').unsigned().primary();
        t.string('username').notNullable();
        t.string('password').notNullable();
        t.string('type').notNullable();
        t.timestamps(false, true);
    })
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTableIfExists('user');
};
