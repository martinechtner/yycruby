module GenerateMapData
  extend ActiveSupport::Concern

  included do
  end

  def generate_json
    if @next_meetup.present?
      Gmaps4rails.build_markers(@next_meetup) do |location, marker|
        marker.lat location.venue['lat']
        marker.lng location.venue['lon']
      end
    else
      Gmaps4rails.build_markers(['placeholder']) do |_placeholder, marker|
        marker.lat 51.0486151
        marker.lng -114.0708459
      end
    end
  end
end
