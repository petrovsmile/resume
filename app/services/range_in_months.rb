class RangeInMonths
  def initialize(start_date, finish_date)
    @start_date = start_date
    @finish_date = finish_date
  end

  def call
    count = 0
    while @start_date < @finish_date
      count += 1
      @start_date += 1.month
    end
    count
  end
end