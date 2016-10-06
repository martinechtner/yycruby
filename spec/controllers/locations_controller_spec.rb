RSpec.describe LocationsController, type: :controller do

  describe 'GET #index' do
    let(:meetup) { MeetupClientRails::Model::Event.new({ 'id' => 'id_123',
                                                         'name' => 'Meetup Topic',
                                                         'time' => Time.now,
                                                         'description' => Faker::Lorem::paragraph,
                                                         'venue' => { 'id' => 10245992,
                                                                      'name' => 'Assembly',
                                                                      'lat' => 51.0530891418457,
                                                                      'lon' => -114.09489440917969,
                                                                      'repinned' => false,
                                                                      'address_1' => '119 - 14 Street NW (Floor 4)',
                                                                      'city' => 'Calgary',
                                                                      'country' => 'ca',
                                                                      'localized_country_name' => 'Canada',
                                                                      'zip' => '',
                                                                      'state' => 'AB' }, }) }
    let(:next_meetup) { meetup }

    before do
      expect(MeetupClientRails::Events).to receive(:all).and_return([next_meetup])
    end

    it 'renders index' do
      get :index
      expect(assigns(:next_meetup)).to eq next_meetup
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end
end
