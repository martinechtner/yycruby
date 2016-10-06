module GenerateMapData
  extend ActiveSupport::Concern

  included do
  end

  def generate_json
    Gmaps4rails.build_markers(@next_meetup) do |location, marker|
      marker.lat location.venue['lat']
      marker.lng location.venue['lon']
    end
  end
end
