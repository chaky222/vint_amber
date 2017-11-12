require "jasper_helpers"
require "json"

class ApplicationController < Amber::Controller::Base
  include JasperHelpers
  LAYOUT = "application.slang"

  def self.options_for_select(arr : Array, sel : Array = [] of String)
    # puts "\n\n options_for_select arr=[#{arr.inspect}]\n\n"
    # sel = selected.split(',')
    arr.map { |x| "<option value='#{ x[1] }' #{ sel.includes?(x[1].to_s) ? "selected='selected'" : "" } #{ x[2]? ? "title='#{ x[2] }'" : "" }>#{ x[0] }</option>" }.join("")
  end

  def to_json_main_text(main_text : String = "", title : String = "")
    Dummy_main_text_to_json.new(main_text, title, Time.now - context.time_start).to_json()
  end
  def arr_i8(x : Array(T)) forall T
    x.map { |v| v.to_i8 }
  end
  private struct Dummy_main_text_to_json
    JSON.mapping({ result: Int32, main_text: String, search_time: String, title: String })
    def initialize(@main_text, @title, time_spent)
      @result = 1
      @search_time = Amber::Pipe::Logger.elapsed_text(time_spent)
    end
  end
end
