require "colorize"

module Amber
  module Pipe
    class Logger < Base
      def colorize(text, color)
        text.colorize(color).toggle(Amber::Settings.color).to_s
      end

      def initialize(io : IO = STDOUT)
        @io = io
        # @time_start = Time.now
      end

      def call(context : HTTP::Server::Context)
        time = Time.now
        # puts "\n time=[#{time.inspect}] time_start=[#{context.time_start}]\n \n\n"
        # @time_start = time
        call_next(context)
        status = context.response.status_code
        elapsed_time = Time.now - time
        puts "\n elapsed_time=[#{ elapsed_time.total_seconds.to_s }] \n"
        elapsed = self.class.elapsed_text(elapsed_time)
        @io.puts "#{http_status(status)} | #{method(context)} #{path(context)} | #{elapsed}"
        @io.puts "Params: #{colorize(context.params.to_s, :yellow)}"
        context
      end

      def method(context)
        colorize(context.request.method, :light_red) + " "
      end

      def path(context)
        "\"" + colorize(context.request.path.to_s, :yellow) + "\" "
      end

      def http_status(status)
        case status
        when 200
          text = colorize("200 ", :green)
        when 404
          text = colorize("404 ", :red)
        end
        "#{text}"
      end
      # class << self
        def self.elapsed_text(elapsed)
          millis = elapsed.total_milliseconds
          return "#{(millis/1000).round(2)}s" if millis >= 1000
          return "#{millis.round(2)}ms" if millis >= 1
          "#{(millis * 1000).round(2)}µs"
        end
      # end
    end
  end
end
