RSpec.describe Job, type: :model do
  it { is_expected.to validate_presence_of :company }
  it { is_expected.to validate_presence_of :company_career_url }
  it { is_expected.to validate_presence_of :posting_url }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :logo }
end
