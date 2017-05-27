require 'soda/client'

class ParksController < ApplicationController

  def index
    name = params[:name] || ""
    address = params[:address] || ""
    # parameter_hash = { name: name, address: address}
    park_request = ParkQuery.new
    @parks = park_request.get_park(name)
  end

  def show

  end


  def client
    @client ||= SODA::Client.new({ :domain => "data.cityofmadison.com" })
  end


  def get_park(name)
    results = client.get("x4ks-m4xg", { :$limit => 50, :name => name })
  end

end
