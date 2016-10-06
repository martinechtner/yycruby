RSpec.describe 'locations/index.html.erb', type: :view do
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
  before(:each) do
    assign(:next_meetup, meetup)
  end

  subject { render }

  include_examples 'a basic view'
end
