import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  protected tableName = 'ipaddresses'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
      table.integer('hash_id').notNullable().unsigned().references('hash').inTable('hashes');;
      table.string('ip');
      table.float('abuse_reputation');
      table.json('geolocation');
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
