require "granite_orm/adapter/mysql"

class Order < Granite::ORM::Base
  adapter mysql
  table_name orders


  id : Int64 # primary key is created for you
  field name : String
  field number : Int32
  field status : Int32
  field add_time : Time
  # field status : Slice(UInt8)
  # field name : String
  timestamps
end
