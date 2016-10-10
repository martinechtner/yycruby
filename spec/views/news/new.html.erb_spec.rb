RSpec.describe 'news/new', type: :view do
  subject { render }

  before(:each) do
    @news = assign(:news, create(:news))
  end

  include_examples 'a basic view'
end
