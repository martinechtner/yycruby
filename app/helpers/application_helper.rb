module ApplicationHelper
  def convert_to_date(time)
    Time.at(time.to_f/1000).to_date
  end

  def convert_to_datetime(time)
    Time.at(time.to_f/1000)
  end
end
