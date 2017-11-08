require "granite_orm/adapter/mysql"

class Post < Granite::ORM::Base
  adapter mysql
  table_name posts

  # id : Int64 primary key is created for you
  field name : String
  field body : String
  field draft : Bool
  timestamps

  # def self.new(x)
  #   puts "\n\nnew x=[#{x.inspect}] \n\n"
  #   c = allocate
  #   c.name = "popopop"
  #   # super
  #   # c.initialize
  #   # c
  #   # x[:draft] = 1
  #   # puts "\n\nnew2 x=[#{x.inspect}] \n\n"
  #   super()
  # end

  # def initialize()
  #   puts "\n\n initialize args=[#{1}] \n\n"
  #   super
  # end

  # def initialize(args)
  #   puts "\n\n initialize1 args=[#{args.inspect}] \n\n"
  #   args[:draft] = 1
  #   puts "\n\n initialize2 args=[#{args.inspect}] \n\n"
  #   super(args)
  # end

  # def set_attributes(args : Hash(Symbol | String, DB::Any))
  #   puts "\n\n set_attributes args=[#{args.inspect}] \n\n"
  #   args.each do |k, v|
  #     cast_to_field(k, v)
  #   end
  # end

  # def set_attributes(args : Hash(String | Symbol, JSON::Type))
  #   puts "\n\n set_attributes2 args=[#{args.inspect}] \n\n"
  #   args.each do |k, v|
  #     cast_json_to_field(k, v.as(JSON::Type | Int32 | Float32 | Time))
  #   end
  # end


  # JSON.mapping
end
