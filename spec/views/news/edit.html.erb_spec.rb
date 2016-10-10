RSpec.describe 'news/edit', type: :view do
  subject { render }

  before(:each) do
    @news = assign(:news, create(:news))
  end

  it 'renders the edit news form' do
    subject

    assert_select 'form[action=?][method=?]', news_path(@news), 'post' do

      assert_select 'textarea#news_content[name=?]', 'news[content]'
    end
  end
end
