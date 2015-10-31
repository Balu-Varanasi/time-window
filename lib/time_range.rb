# TimeRange
class TimeRange
  DAY_NAMES = Time::RFC2822_DAY_NAME

  def initialize(time_range_string = '')
    @time_range_string = time_range_string
    @days = []
    @hours = []

    parse_days_and_hours
  end

  def include?(time_string)
    time = Time.parse(time_string)
    any?(@days, time.wday) && any?(@hours, time.strftime('%H%M').to_i)
  end

  def any?(range, value)
    return true if range.empty?
    range.any? { |x| x.include?(value) }
  end

  private

  def parse_days_and_hours
    @time_range_string.strip.split(' ').each do |range|
      if (match = /(\d{4})-(\d{4})/.match(range))
        add_to_hours(match[1], match[2])
      elsif (match = /([a-zA-Z]{3})-([a-zA-Z]{3})/.match(range))
        add_to_days(match[1], match[2])
      else
        add_to_days(range, range)
      end
    end
  end

  def add_to_hours(start_hour, end_hour)
    @hours << (start_hour.to_i...end_hour.to_i)
  end

  def add_to_days(start_, end_)
    start_day = DAY_NAMES.index(start_)
    end_day = DAY_NAMES.index(end_)
    if start_day < end_day
      @days << (start_day..end_day)
    elsif start_day == end_day
      @days << (start_day..end_day)
    else
      @days << (start_day..(DAY_NAMES.size - 1))
      @days << (0..end_day)
    end
  end
end
