module ParksHelper
  def render_features_for(park)
    output = "<table class='table'>"
    features = [
      {query: 'baseball', display_name: 'Baseball'},
      {query: 'b_cycle_station', display_name: 'Bike Racks'}
    ]
    features.each do |feature|
      output += "<tr><td>#{feature[:display_name]}?</td><td>#{ParkQuery.has_feature?(park, feature[:query])}</td></tr>"
    end
    output += "</table>"
    output.html_safe
  end
end
