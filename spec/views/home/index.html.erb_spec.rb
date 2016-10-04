RSpec.describe 'home/index', type: :view do
  let(:meetup) { MeetupClientRails::Model::Event.new({ 'name' => 'Meetup Topic',
                                                        'time' => Time.now,
                                                        'description' => Faker::Lorem::paragraph }) }
  before(:each) do
    assign(:next_meetup, meetup)
    assign(:past_meetups, [meetup, meetup])
  end

  subject { render }

  include_examples 'a basic view'
end
