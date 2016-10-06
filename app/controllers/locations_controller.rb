class LocationsController < ApplicationController
  include GenerateMapData

  def index
    @next_meetup = MeetupClientRails::Events.all(MEETUP_GROUP_SLUG).first
    @map_hash = generate_json
  end
end
