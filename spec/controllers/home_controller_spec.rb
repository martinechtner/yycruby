RSpec.describe HomeController, type: :controller do

  describe 'GET #index' do
    let(:meetup) { MeetupClientRails::Model::Event.new({ 'id' => 'id_123',
                                                         'name' => 'Meetup Topic',
                                                         'time' => Time.now,
                                                         'description' => Faker::Lorem::paragraph }) }
    let(:next_meetup) { meetup }
    let(:past_meetups) { [meetup, meetup, meetup] }

    before do
      expect(MeetupClientRails::Events).to receive(:all).and_return([next_meetup], past_meetups)
    end

    it 'renders index' do
      get :index
      expect(assigns(:next_meetup)).to eq next_meetup
      expect(assigns(:past_meetups)).to eq past_meetups
      expect(response).to render_template(:index)
    end
  end
end
