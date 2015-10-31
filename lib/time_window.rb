# TimeWindow
class TimeWindow
  def initialize(time_range_strings = [])
    @ranges = []
    time_range_strings.each do |time_range_string|
      @ranges << TimeRange.new(time_range_string)
    end
  end

  def include?(time)
    return true if @ranges.empty?
    @ranges.any? { |x| x.include?(time) }
  end
end
