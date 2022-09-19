class RangeInMonths
  def self.get(start, finish)
    count = 0
    while start < finish
      count += 1
      start += 1.month
    end
    count
  end
end