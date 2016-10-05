RSpec.describe 'sponsors/index', type: :view do

  subject { render }

  before(:each) do
    assign(:sponsors, [create(:sponsor), create(:sponsor)])
  end

  include_examples 'a basic view'
end
