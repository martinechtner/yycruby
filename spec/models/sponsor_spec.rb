RSpec.describe Sponsor, type: :model do
  it { is_expected.to validate_presence_of :company }
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_presence_of :sponsoring }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :logo }

  describe 'On Save' do
    let(:sponsor) { build(:sponsor, url: 'www.test.com') }

    subject { sponsor.save }

    it 'formats the url' do
      subject
      expect(sponsor.url).to eq 'http://www.test.com'
    end
  end
end
