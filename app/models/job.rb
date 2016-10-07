class Job < ApplicationRecord

  validates_presence_of :company, :company_career_url, :posting_url, :description, :title, :logo

  has_attached_file :logo,
                    source_file_options: { all: '-auto-orient' },
                    styles: { original: '', thumb: '200x85' }

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  before_save :format_urls

  private

  def format_urls
    self.posting_url = "http://#{self.posting_url}" unless self.posting_url[/^https?/]
    self.company_career_url = "http://#{self.company_career_url}" unless self.company_career_url[/^https?/]
  end
end
