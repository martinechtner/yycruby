RSpec.describe 'sponsors/new', type: :view do
  before(:each) do
    assign(:sponsor, create(:sponsor))
  end

  subject { render }

  include_examples 'a basic view'
end
