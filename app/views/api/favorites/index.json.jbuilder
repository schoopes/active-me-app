json.array! @favorites.each do |favorite|
  json.city favorite["city"]
  json.event favorite["title"]
  json.venue favorite["venue_name"]
  json.start favorite["start_time"]
  json.end favorite["start_time"]
  json.id favorite["id"]
end




