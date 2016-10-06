RSpec.describe 'jobs/index', type: :view do
  before(:each) do
    @jobs = assign(:job, [create(:job), create(:job)])

  end

  subject { render }

  include_examples 'a basic view'
end
