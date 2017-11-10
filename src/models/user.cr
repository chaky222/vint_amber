require "granite_orm/adapter/pg"

class User < Granite::ORM::Base
  adapter pg
  table_name users


  # id : Int64 primary key is created for you
  field name : String
  field prof_list : String
  field slack_team_id : Int32
  field slack_name : String
  timestamps
end
