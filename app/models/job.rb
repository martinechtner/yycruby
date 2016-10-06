class Job < ApplicationRecord

  validates_presence_of :company, :company_career_url, :posting_url, :description, :title, :logo

  has_attached_file :logo,
                    source_file_options: { all: '-auto-orient' },
                    styles: { original: '', thumb: '200x85' }

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
