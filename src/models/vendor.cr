require "granite_orm/adapter/mysql"

class Vendor < Granite::ORM::Base
  @@CACHE = [] of self
  @@CACHED : Bool = false

  adapter mysql
  table_name vendor

  id : Int64 # primary key is created for you
  field name : String
  # field slack_team_id : String
  # field slack_name : String
  # field prof_list : String
  timestamps

  # property profs : Array(UInt8)

  def self.get(id : Int64 | Int16)
    id = id.to_i64 unless id.is_a?(Int64)
    all.find { |u| u.id == id }
  end

  def self.get_name(id_in : Int64 | Int16 | Nil)
    id : Int64 = (id_in || 0).to_i64
    return "" unless id > 0
    u = get(id)
    u ? u.name || "Error name" : "Vendor[#{id}] not found!"
  end

  def self.all(clause : String = "")
    return super(clause) if clause.size > 0
    return @@CACHE if @@CACHED
    @@CACHED = true
    @@CACHE = super
    # @@CACHE.each do |u|
    #   str : String = u.prof_list || ""
    #   if str.size > 2
    #     str.split(',').each { |e| u.push_prof(e.to_u8) if e.size > 0 }
    #   else
    #     u.push_prof(3.to_u8)
    #   end
    # end
    return @@CACHE
  end

  def self.clear_cache
    @@CACHED = false
  end

  # def self.managers
  #   all.reject { |x| x.profs.includes?(3.to_u8) }
  # end
end
