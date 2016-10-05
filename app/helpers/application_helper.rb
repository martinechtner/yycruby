module ApplicationHelper

  BOOTSTRAP_FLASH_MSG = {
    success: 'success',
    error: 'danger',
    alert: 'warning',
    notice: 'info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG[flash_type.to_sym]
  end

  def convert_to_date(time)
    Time.at(time.to_f/1000).to_date
  end

  def convert_to_datetime(time)
    Time.at(time.to_f/1000)
  end
end
