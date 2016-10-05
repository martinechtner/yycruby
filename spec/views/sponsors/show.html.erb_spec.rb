RSpec.describe 'sponsors/show', type: :view do
  before(:each) do
    @sponsor = assign(:sponsor, create(:sponsor))
  end

  subject { render }

  include_examples 'a basic view'
end
