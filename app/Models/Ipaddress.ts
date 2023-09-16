import {
  column,
  BaseModel,
  manyToMany,
  ManyToMany,
} from '@ioc:Adonis/Lucid/Orm'
 import Hash from 'App/Models/Hash';
import { DateTime } from 'luxon'

export default class IPAddress extends BaseModel {
  static get table() {
    return 'ipaddresses'
  }
  
  @column({ isPrimary: true })
  public id: number;

  @column.dateTime({ autoCreate: true })
  public created_at: DateTime;

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updated_at: DateTime;

  @column({ columnName: 'hash_id' })
  public hash_id: number;

  @column()
  public ip: string;

  @column()
  public abuse_reputation: number;

  @column()
  public geolocation: Record<string, any>;

  @column()
  public vpn: boolean;

  @column()
  public proxy: boolean;

  @column()
  public tor: boolean;

  @column()
  public relay: boolean;

  @column()
  public hosting: boolean;

  @manyToMany(() => Hash, {
    pivotTable: 'hash_ipaddress', 
  })
  public hashes: ManyToMany<typeof Hash>;
}

module.exports = IPAddress;
