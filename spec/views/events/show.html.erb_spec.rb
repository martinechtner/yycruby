RSpec.describe 'events/show', type: :view do
  let(:meetup) { MeetupClientRails::Model::Event.new({ 'id' => 'id_123',
                                                       'name' => 'Meetup Topic',
                                                       'time' => Time.now,
                                                       'description' => Faker::Lorem::paragraph }) }
  before(:each) do
    assign(:meetup, meetup)
  end

  subject { render }

  include_examples 'a basic view'
end
