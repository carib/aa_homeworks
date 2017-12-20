# Show all guests and guest gifts
json.name @party.name
json.location @party.location

json.guests @party.guests do |guest|
  json.name guest.name
  
  json.gifts guest.gifts do |gift|
    json.title gift.title
    json.description gift.description
  end
end
