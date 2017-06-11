module ParksHelper
  def render_facilities_for(park)
    output = "<ul class='facilities-list'>"

    ParkQuery::FACILITY_NAMES.each do |facility|
      if ParkQuery.has_facility?(park, facility[:query])
        output += "<li><p>#{facility[:display_name]}</p></li>"
      end
    end
    output += "</ul>"
    output.html_safe
  end
end
