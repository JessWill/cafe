import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  protected tableName = 'ipaddresses'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
      table.integer('hash_id').unsigned().references('id').inTable('hashes');
      table.string('ip_address').notNullable();
      table.float('abuse_reputation').notNullable();
      table.json('geolocation').notNullable();
      table.boolean('vpn');
      table.boolean('proxy');
      table.boolean('tor');
      table.boolean('relay');
      table.boolean('hosting');
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
