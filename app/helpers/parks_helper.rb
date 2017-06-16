module ParksHelper
  def render_facilities_for(park)
    output = "<ul class='facilities-list text-center'>"

    display_array = []
    ParkQuery::FACILITY_NAMES.each do |facility|
      if ParkQuery.has_facility?(park, facility[:query])
        display_array << facility[:display_name]
      end
    end
    display_array.uniq.each do |name|
      output += "<li class='facility-item'><p>#{name}</p></li>"
    end
    output += "</ul>"
    output.html_safe
  end
end
