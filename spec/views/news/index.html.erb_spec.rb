RSpec.describe 'news/index', type: :view do
  subject { render }

  before(:each) do
    @news = assign(:news, [create(:news), create(:news)])
  end

  include_examples 'a basic view'
end
