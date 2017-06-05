class ParkQuery
  attr_reader :client

  FACILITY_NAMES = [
    {query: 'baseball', display_name: 'baseball'},
    {query: 'b_cycle_station', display_name: 'bike racks'},
    {query: 'boat_mooring', display_name: 'boat mooring'},
    {query: 'boat_mooring', display_name: 'boating'}
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
