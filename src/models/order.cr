require "granite_orm/adapter/mysql"

class Order < Granite::ORM::Base
  adapter mysql
  table_name orders


  # id : Int32 # primary key is created for you
  field name : String
  field number : Int32
  field status : Int32
  # field status : Slice(UInt8)
  # field name : String
  timestamps
end
