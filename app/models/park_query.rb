class ParkQuery
  attr_reader :client

  def initialize
    @client ||= SODA::Client.new({ :domain => "data.cityofmadison.com" })
  end

  def get_park(name)
    results = client.get("x4ks-m4xg", { :$limit => 50, :name => name })
  end

  def self.has_feature?(park, feature)
    park.fetch(feature, false)
  end
end
