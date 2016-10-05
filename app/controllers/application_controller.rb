class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  MEETUP_GROUP_SLUG = 'YYC-Rb'
end
