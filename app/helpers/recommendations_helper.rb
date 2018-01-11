require 'googlestaticmap'

module RecommendationsHelper
  def intro(arguments={}, &blk)
    render 'recommendations/cards/intro', arguments.merge(content: capture(&blk))
  end

  def recommendation(arguments={}, &blk)
    raise 'An ID must be provided for each recommendation so we can track clicks. This should be a short description of this particular recommendation. e.g. getting-fit-roundhay-park' if arguments[:id].blank?
    raise 'A reason must be provided for each recommendation' if arguments[:why].blank?
    render 'recommendations/cards/recommendation', arguments.merge(content: capture(&blk))
  end

  def map(latitude:, longitude:, zoom: 14)

    location = MapLocation.new(latitude: latitude, longitude: longitude)
    map = GoogleStaticMap.new(
      width: 500,
      height: 128,
      zoom: zoom,
      center: location,
      api_key: Rails.application.secrets.maps_key
    )
    map.markers << MapMarker.new(location: location)
    render 'recommendations/cards/map', map_url: map.url('https')
  end

  def interest_button(message)
    render 'recommendations/cards/interest_button', message: message
  end

  def want_to_start(arguments={}, &blk)
    render 'recommendations/cards/want_to_start'
  end

end
