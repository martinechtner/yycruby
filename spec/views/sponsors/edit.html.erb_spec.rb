RSpec.describe 'sponsors/edit', type: :view do

  subject { render }

  before(:each) do
    @sponsor = assign(:sponsor, create(:sponsor))
  end

  it 'renders the edit sponsor form' do
    subject

    assert_select 'form[action=?][method=?]', sponsor_path(@sponsor), 'post' do

      assert_select 'input#sponsor_company[name=?]', 'sponsor[company]'

      assert_select 'textarea#sponsor_description[name=?]', 'sponsor[description]'

      assert_select 'input#sponsor_url[name=?]', 'sponsor[url]'

      assert_select 'textarea#sponsor_sponsoring[name=?]', 'sponsor[sponsoring]'
    end
  end

  include_examples 'a basic view'
end
