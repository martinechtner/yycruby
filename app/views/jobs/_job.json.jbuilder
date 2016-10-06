json.extract! job, :id, :company, :description, :company_career_url, :posting_url, :title, :logo, :created_at, :updated_at
json.url job_url(job, format: :json)