RSpec.describe Job, type: :model do
  it { is_expected.to validate_presence_of :company }
  it { is_expected.to validate_presence_of :company_career_url }
  it { is_expected.to validate_presence_of :posting_url }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :logo }

  describe 'On Save' do
    let(:job) { build(:job, posting_url: 'www.test.com/job_posting', company_career_url: 'https://www.test.com') }

    subject { job.save }

    it 'formats the url' do
      subject
      expect(job.posting_url).to eq 'http://www.test.com/job_posting'
      expect(job.company_career_url).to eq 'https://www.test.com'
    end
  end
end
