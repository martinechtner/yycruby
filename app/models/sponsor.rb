class Sponsor < ApplicationRecord
  acts_as_list

  validates_presence_of :company, :url, :description, :sponsoring, :logo

  has_attached_file :logo,
                    source_file_options: { all: '-auto-orient' },
                    style: { original: '', thumb: '200x85' }

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  before_save :format_url

  private

  def format_url
    self.url = "http://#{self.url}" unless self.url[/^https?/]
  end
end
