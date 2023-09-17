import Database from '@ioc:Adonis/Lucid/Database'

export default class ViewCounterSeeder {
  public async run() {
    await Database.table('viewcounters').insert({ count: 0 })
  }
}
