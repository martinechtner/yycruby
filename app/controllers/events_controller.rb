class EventsController < ApplicationController

  def index
    @next_meetup = MeetupClientRails::Events.all('YYC-Rb').first
    @past_meetups = MeetupClientRails::Events.all('YYC-Rb', status: 'past').reverse
  end

  def show
    @meetup = MeetupClientRails::Events.find('YYC-Rb', params[:id])
  end
end
