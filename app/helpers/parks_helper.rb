module ParksHelper
  def render_facilities_for(park)
    output = "<table class='table'>"

    ParkQuery::FACILITY_NAMES.each do |facility|
      if ParkQuery.has_facility?(park, facility[:query])
        output += "<tr><td>#{facility[:display_name]}?</td></tr>"
      end
    end
    output += "</table>"
    output.html_safe
  end
end
