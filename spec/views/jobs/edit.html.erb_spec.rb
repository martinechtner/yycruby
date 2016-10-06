RSpec.describe 'jobs/edit', type: :view do
  subject { render }

  before(:each) do
    @job = assign(:job, create(:job))
  end

  it 'renders the edit job form' do
    subject

    assert_select 'form[action=?][method=?]', job_path(@job), 'post' do

      assert_select 'input#job_company[name=?]', 'job[company]'

      assert_select 'textarea#job_description[name=?]', 'job[description]'

      assert_select 'input#job_company_career_url[name=?]', 'job[company_career_url]'

      assert_select 'input#job_posting_url[name=?]', 'job[posting_url]'

      assert_select 'input#job_title[name=?]', 'job[title]'

      assert_select 'input#job_logo[name=?]', 'job[logo]'
    end
  end

  include_examples 'a basic view'
end
