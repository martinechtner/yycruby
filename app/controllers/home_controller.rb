class HomeController < ApplicationController
  include GenerateMapData

  def index
    @next_meetup = MeetupClientRails::Events.all(MEETUP_GROUP_SLUG).first
    @past_meetups = MeetupClientRails::Events.all(MEETUP_GROUP_SLUG, status: 'past').reverse
    @map_hash = generate_json
    @news = News.last
  end
end
