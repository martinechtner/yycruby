class Sponsor < ApplicationRecord
  validates_presence_of :company, :url, :description, :sponsoring
end
