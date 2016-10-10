RSpec.describe 'news/show', type: :view do
  before(:each) do
    @news = assign(:news, create(:news))
  end

  subject { render }

  include_examples 'a basic view'
end
