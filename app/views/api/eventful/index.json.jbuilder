# json.events @events

json.array! @events.each do |event|
  json.event event["title"]
  json.city event["city_name"]
  json.venue event["venue_name"]
  json.address event["venue_address"]
  json.when event["start_time"]
  json.description event["description"].gsub(/<\/?[^>]+>/, "")
  json.eventful_url event["venue_url"]
  json.id event["id"]
end