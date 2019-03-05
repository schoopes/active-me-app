json.array! @favorites.each do |favorite|
  json.city favorite["city"]
  json.event favorite["title"]
  json.venue favorite["venue_name"]
  json.when favorite["start_time"]
end


