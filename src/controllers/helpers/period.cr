module Utils
  class Period
    property start : Time
    property ending : Time

    def self.by_date_range_str(date_range_str : Nil | String , params = NamedTuple(default: Symbol))
      defaults = [nil, nil] of Time | Nil
      if params[:default]
        defaults = [Time.now.at_beginning_of_month, Time.now.at_end_of_month] if params[:default] == :cur_month
        defaults = [Time.now.date, Time.now.date] if params[:default] == :today
        defaults = [Time.now.date - 5.day, Time.now.date + 5.day] if params[:default] == :plus_minus_5
        # defaults = [Date.today, Date.today] if params[:default] == :plus_minus_5
      end
      period = {} of Symbol => Time
      puts "\n\n date_range_str=[#{date_range_str}] \n\n"
      date_strs_arr = date_range_str && date_range_str.size > 5 ? date_range_str.split(" - ") : [] of String
      puts "\n\n date_strs_arr=[#{date_strs_arr.inspect}] \n\n"
      if date_strs_arr.size > 1
        period[:start]  = Time.parse(date_strs_arr[0].strip, "%F") rescue defaults[0]        
        period[:ending] = Time.parse(date_strs_arr[1].strip, "%F") rescue defaults[1]
        # puts "\n\n\n start=[#{start.to_s}] \n\n"
      else
        period[:start]  ||= defaults[0] || raise "Error start date."
        period[:ending] ||= defaults[1] || raise "Error ending date."
      end
      raise "Error in by_date_range_str. Set defaults pls or normal date range." unless period[:start]? && period[:ending]?
      period[:start] = period[:ending] if period[:start] > period[:ending]
      new(period)
    end

    def initialize(period = {} of Symbol => Time)
      @start = period[:start]? || Time.now.date
      @ending = period[:ending]? || Time.now.date
    end

    def to_sql
      "BETWEEN '#{start.to_s("%Y-%m-%d")} 00:00:00' AND '#{ending.to_s("%Y-%m-%d")} 23:59:59'"
    end

    # def to_a
    #   [start, ending]
    # end

    # def interval
    #   start..ending
    # end

    # def one_full_month?
    #   if start.beginning_of_month == start && ending.end_of_month == ending
    #     return (start.beginning_of_month == ending.beginning_of_month)
    #   end
    #   false
    # end

    def days
      (@ending - @start).days
    end

    # def days_with_word
    #   days_count ? days_count.to_s + ' ' + days_diff_words(days_count) : ''
    # end
    def to_s
      # "xzczczc"
    # end

    # def to_s(params = {} of Symbol => {} | nil)
    # #   if params[:by_monthes] && start.beginning_of_month == start && ending.end_of_month == ending # round month
    # #     if start.beginning_of_month == ending.beginning_of_month # for one month
    # #       Russian::strftime(start, '%m.%Y')
    # #     else # for few monthes
    # #       Russian::strftime(start, '%m.%Y') + ' - ' + Russian::strftime(ending, '%m.%Y')
    # #     end
    # #   elsif params[:by_point] # not for monthes, days need
    # #     Russian::strftime(start, '%d.%m.%Y') + ' - ' + Russian::strftime(ending, '%d.%m.%Y')
    # #   else
        @start.to_s("%Y-%m-%d") + " - " + @ending.to_s("%Y-%m-%d")
    # #   end
    end

    # private

    # def days_diff_words(diff)
    #   Russian.p(diff, 'день', 'дня', 'дней', 'дней')
    # end
 
  end
end
