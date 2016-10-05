class EventsController < ApplicationController

  def index
    @next_meetup = MeetupClientRails::Events.all(MEETUP_GROUP_SLUG).first
    @past_meetups = MeetupClientRails::Events.all(MEETUP_GROUP_SLUG, status: 'past').reverse
  end

  def show
    @meetup = MeetupClientRails::Events.find(MEETUP_GROUP_SLUG, params[:id])
  end
end
