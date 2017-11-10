require "granite_orm/adapter/pg"

class Order < Granite::ORM::Base
  adapter pg
  table_name orders


  # id : Int64 primary key is created for you
  field name : String
  field number : Int32
  field status : Int32
  timestamps
end
