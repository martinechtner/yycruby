RSpec.describe 'jobs/new', type: :view do
  before(:each) do
    @job = assign(:job, create(:job))
  end

  subject { render }

  include_examples 'a basic view'
end
