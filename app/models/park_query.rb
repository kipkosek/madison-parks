class ParkQuery
  attr_reader :client

  FACILITY_NAMES = [
    {query: 'baseball', display_name: 'baseball'},
    {query: 'basketball', display_name: 'basketball'},
    {query: 'b-cycle_station', display_name: 'bike racks'},
    {query: 'beach', display_name: 'beach'},
    {query: 'boat_launch', display_name: 'boat launch'},
    {query: 'boat_mooring', display_name: 'boat mooring'},
    {query: 'boat_mooring', display_name: 'boating'},
    {query: 'botanical_gardens', display_name: 'botanical gardens'},
    {query: 'canoe/kayak_launch', display_name: 'canoe/kayak launch'},
    {query: 'canoe/kayak_storage', display_name: 'canoe/kayak storage'},
    {query: 'canoe/kayak_rental', display_name: 'canoe/kayak rental'},
    {query: 'cricket', display_name: 'cricket'},
    {query: 'disc_golf', display_name: 'disc golf'},
    {query: 'dog off-leash park', display_name: 'dogs'},
    {query: 'dog on-leash area', display_name: 'dogs'},
    {query: 'drinking_fountain', display_name: 'drinking fountain'},
    {query: 'fireplace', display_name: 'fireplace'},
    {query: 'football', display_name: 'football'},
    {query: 'hiking', display_name: 'hiking'},
    {query: 'historical_feature', display_name: 'historical feature'},
    {query: 'horseshoe', display_name: 'horseshoe'},
    {query: 'ice_skating', display_name: 'ice skating'},
    {query: 'lacrosse', display_name: 'lacrosse'},
    {query: 'open_field', display_name: 'open field'},
    {query: 'parking_lot', display_name: 'parking'},
    {query: 'pickleball', display_name: 'pickleball'},
    {query: 'picnic_shelter', display_name: 'picnic shelter'},
    {query: 'playground', display_name: 'playground'},
    {query: 'pool', display_name: 'pool'},
    {query: 'recreation_center', display_name: 'recreation center'},
    {query: 'reservable_shelter', display_name: 'shelter'},
    {query: 'restroom', display_name: 'restroom'},
    {query: 'scenic_overlook', display_name: 'scenic overlook'},
    {query: 'skate_park', display_name: 'skate park'},
    {query: 'ski_trail', display_name: 'skiing'},
    {query: 'slacklining', display_name: 'slacklining'},
    {query: 'sledding_hill', display_name: 'sledding'},
    {query: 'snowshoeing', display_name: 'snowshoeing'},
    {query: 'soccer', display_name: 'soccer'},
    {query: 'softball', display_name: 'softball'},
    {query: 'splash_park', display_name: 'splash park'},
    {query: 'tennis', display_name: 'tennis'},
    {query: 'ultimate_frisbee', display_name: 'ultimate frisbee'},
    {query: 'volleyball', display_name: 'volleyball'}
  ]

  def initialize
    @client ||= SODA::Client.new({ :domain => "data.cityofmadison.com" })
  end

  def get_park(name_search)
    client.get("x4ks-m4xg", { :$limit => 50, "$where" => "name LIKE '%#{name_search}%'" })
  end

  def get_parks_with_facility(facility)
    client.get("x4ks-m4xg", { :$limit => 50, "$select" => "*", "$where" => "#{facility}=true" })
  end

  def self.has_facility?(park, facility)
    park.fetch(facility, false)
  end

  def self.get_facility_name_by_query(value)
    FACILITY_NAMES.map {|hash| hash[:display_name] if hash[:query] == value }.compact.first
  end

  def self.get_facility_name_by_display_name(value)
    FACILITY_NAMES.map {|hash| hash[:query] if hash[:display_name] == value }.compact.first
  end
end
