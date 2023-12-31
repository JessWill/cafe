import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  protected tableName = 'ipaddresses'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
      table.integer('hash_id').notNullable().unsigned().references('id').inTable('hashes');;
      table.string('ip')
      table.float('abuse_reputation');
      table.json('geolocation');
      table.string('colour')
      table.json('pulses');

    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
