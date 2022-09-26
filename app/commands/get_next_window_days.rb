class GetNextWindowDays < PowerTypes::Command.new
  def perform
    next_window_days
  end

  def next_window_days
    @days = []
    future_date = today
    while @days.length < 7
      future_date.on_weekday? && @days << future_date
      future_date += 1.day
    end
    @days
  end

  def today
    Time.now.to_date
  end
end
