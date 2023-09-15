import {
  column,
  BaseModel,
  manyToMany,
  ManyToMany,
} from '@ioc:Adonis/Lucid/Orm'
import Hash from 'App/Models/Hash';
import { DateTime } from 'luxon'

export default class IPAddress extends BaseModel {
  @column({ isPrimary: true })
  public id: number;

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime;

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime;

  @column({ columnName: 'hash_id' })
  public hashId: number;

  @column()
  public ipAddress: string;

  @column()
  public abuseReputation: number;

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
