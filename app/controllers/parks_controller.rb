require 'soda/client'
class ParksController < ApplicationController

  def index
    name = params[:name].split.map(&:capitalize).join(' ') unless params[:name].blank?
    # address = params[:address] || ""
    # parameter_hash = { name: name, address: address}
    facility = params[:facility].downcase unless params[:facility].blank?
    park_request = ParkQuery.new
    if name
      @parks = park_request.get_park(name)
    elsif facility
      Rails.logger.info(">>>>>>>>>> #{facility.inspect}")
      query = ParkQuery.get_facility_name_by_display_name(facility)
      if query
        @parks = park_request.get_parks_with_facility(query)
      end
    else
      @parks = []
    end

    respond_to do |format|
      format.html {render :index}
      format.js
    end
  end

  def show
  end
end
