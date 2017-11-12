require "json"

module Granite::ORM::Fields
  alias Type = DB::Any | JSON::Any
  TIME_FORMAT_REGEX = /\d{4,}-\d{2,}-\d{2,}\s\d{2,}:\d{2,}:\d{2,}/

  macro included
    macro inherited
      FIELDS = {} of Nil => Nil
    end
  end

  # specify the fields you want to define and types
  macro field(decl)
    {% FIELDS[decl.var] = decl.type %}
  end

  # include created_at and updated_at that will automatically be updated
  macro timestamps
    {% SETTINGS[:timestamps] = true %}
  end

  macro __process_fields
    # Create the properties
    {% for name, type in FIELDS %}
      property {{name.id}} : Union({{type.id}} | Nil)
    {% end %}
    {% if SETTINGS[:timestamps] %}
      property created_at : Time?
      property updated_at : Time?
    {% end %}

    # keep a hash of the fields to be used for mapping
    def self.fields(fields = [] of String)
      {% for name, type in FIELDS %}
        fields << "{{name.id}}"
      {% end %}
      {% if SETTINGS[:timestamps] %}
        fields << "created_at"
        fields << "updated_at"
      {% end %}
      return fields
    end

    # keep a hash of the params that will be passed to the adapter.
    def params
      parsed_params = [] of Type
      {% for name, type in FIELDS %}
        {% if type.id == Time.id %}
          parsed_params << {{name.id}}.try(&.to_s("%F %X"))
        {% else %}
          parsed_params << {{name.id}}
        {% end %}
      {% end %}
      {% if SETTINGS[:timestamps] %}
        parsed_params << created_at.not_nil!.to_s("%F %X")
        parsed_params << updated_at.not_nil!.to_s("%F %X")
      {% end %}
      return parsed_params
    end

    def to_h
      fields = {} of String => Type

      fields["{{PRIMARY[:name]}}"] = {{PRIMARY[:name]}}

      {% for name, type in FIELDS %}
        {% if type.id == Time.id %}
          fields["{{name}}"] = {{name.id}}.try(&.to_s("%F %X"))
        {% elsif type.id == Slice.id %}
          fields["{{name}}"] = {{name.id}}.try(&.to_s(""))
        {% else %}
          fields["{{name}}"] = {{name.id}}
        {% end %}
      {% end %}
      {% if SETTINGS[:timestamps] %}
        fields["created_at"] = created_at.try(&.to_s("%F %X"))
        fields["updated_at"] = updated_at.try(&.to_s("%F %X"))
      {% end %}

      return fields
    end

    def to_json(json : JSON::Builder)
      json.object do
        json.field "{{PRIMARY[:name]}}", {{PRIMARY[:name]}}

        {% for name, type in FIELDS %}
          %field, %value = "{{name.id}}", {{name.id}}
          {% if type.id == Time.id %}
            json.field %field, %value.try(&.to_s(%F %X))
          {% elsif type.id == Slice.id %}
            json.field %field, %value.id.try(&.to_s(""))
          {% else %}
            json.field %field, %value
          {% end %}
        {% end %}

        {% if SETTINGS[:timestamps] %}
          json.field "created_at", created_at.try(&.to_s("%F %X"))
          json.field "updated_at", updated_at.try(&.to_s("%F %X"))
        {% end %}
      end
    end

    def set_attributes(args : Hash(String | Symbol, JSON::Type))
      args.each do |k, v|
        cast_json_to_field(k, v.as(JSON::Type | Int32 | Float32 | Time))
      end
    end

    def set_attributes(args : Hash(Symbol | String, DB::Any))
      args.each do |k, v|
        cast_to_field(k, v)
      end
    end

    def set_attributes(**args)
      set_attributes(args.to_h)
    end

    # Cast params and set fields for String
    private def cast_to_field(name, value : DB::Any)
      if !value.nil?
        case name.to_s
          {% for _name, type in FIELDS %}
          when "{{_name.id}}"
            {% if type.id == Int32.id %}
              @{{_name.id}} = value.to_i32
            {% elsif type.id == Int64.id %}
              @{{_name.id}} = value.to_i64
            {% elsif type.id == Int8.id %}
              @{{_name.id}} = value.to_i8
            {% elsif type.id == Int16.id %}
              @{{_name.id}} = value.to_i16
            {% elsif type.id == Float32.id %}
              @{{_name.id}} = value.to_f32{0.0}
            {% elsif type.id == Float64.id %}
              @{{_name.id}} = value.to_f64{0.0}
            {% elsif type.id == Bool.id %}
              @{{_name.id}} = ["1", "yes", "true", true].includes?(value)
            {% elsif type.id == Time.id %}
              if value.is_a?(Time)
                @{{_name.id}} = value
              elsif value.to_s =~ TIME_FORMAT_REGEX
                @{{_name.id}} = Time.parse(value.to_s, "%F %X")
              end
            {% else %}
              @{{_name.id}} = value.to_s
            {% end %}
          {% end %}
        end
      else
        case name.to_s
          {% for _name, type in FIELDS %}
          when "{{_name.id}}"
            @{{_name.id}} = nil
          {% end %}
        end
      end
    end

    # Casts params and sets fields for JSON::Type
    private def cast_json_to_field(name, value : JSON::Type | Int32 | Float32 | Time)
       if !value.nil?
        case name.to_s
          {% for _name, type in FIELDS %}
          when "{{_name.id}}"
            {% if type.id == Int32.id %}
              @{{_name.id}} = value.as(Int64).to_i32
            {% elsif type.id == Int64.id %}
              @{{_name.id}} = value.as(Int64)
            {% elsif type.id == Int8.id %}
              @{{_name.id}} =  value.as(Int64).to_i8
            {% elsif type.id == Int16.id %}
              @{{_name.id}} =  value.as(Int64).to_i16
            {% elsif type.id == Float32.id %}
              @{{_name.id}} = value.as(Float64).to_f32
            {% elsif type.id == Float64.id %}
              @{{_name.id}} = value.as(Float64)
            {% elsif type.id == Bool.id %}
              @{{_name.id}} = ["1", "yes", "true", true].includes?(value)
            {% elsif type.id == Time.id %}
              if value.is_a?(Time)
                @{{_name.id}} = value
              elsif value.to_s =~ TIME_FORMAT_REGEX
                @{{_name.id}} = Time.parse(value.to_s, "%F %X")
              end
            {% else %}
              @{{_name.id}} = value.to_s
            {% end %}
          {% end %}
        end
      else
        case name.to_s
          {% for _name, type in FIELDS %}
          when "{{_name.id}}"
            @{{_name.id}} = nil
          {% end %}
        end
      end
    end
  end
end
