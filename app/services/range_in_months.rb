class RangeInMonths
  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def call
    count = 0
    while @start < @finish
      count += 1
      @start += 1.month
    end
    count
  end
end