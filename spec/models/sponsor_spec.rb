RSpec.describe Sponsor, type: :model do
  it { is_expected.to validate_presence_of :company }
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_presence_of :sponsoring }
  it { is_expected.to validate_presence_of :description }
end
