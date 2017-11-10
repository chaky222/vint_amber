require "granite_orm/adapter/mysql"

class User < Granite::ORM::Base
  adapter mysql
  table_name users


  # id : Int64 primary key is created for you
  field name : String
  field prof_list : String
  field slack_team_id : String
  field slack_name : String
  timestamps
end
