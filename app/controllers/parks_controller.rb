require 'soda/client'
class ParksController < ApplicationController

  def index
    name = params[:name].split.map(&:capitalize).join(' ') unless params[:name].blank?
    facility = params[:facility].downcase unless params[:facility].blank?
    address = params[:address] unless params[:address].blank?
    coordinates = Geocoder.coordinates(address)
    distance = (params[:distance].to_i * 1609) unless params[:distance].blank?

    park_request = ParkQuery.new
    if name
      @parks = park_request.get_park(name)
    elsif facility
      query = ParkQuery.get_facility_name_by_display_name(facility)
      if query
        begin
          @parks = park_request.get_parks_with_facility(query)
        rescue
          @parks = []
          @error = "There was an error finding parks with that activity."
        end
      end
    elsif address
      @parks = park_request.get_parks_near_address(coordinates[0], coordinates[1], distance)
    else
      @parks = []
    end

    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  def show
  end

end
