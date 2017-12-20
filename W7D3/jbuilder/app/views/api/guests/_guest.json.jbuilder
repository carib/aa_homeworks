if params['action'] == 'show'
  json.extract! guest, :name, :age, :favorite_color, :gifts
elsif params['action'] == 'index' && guest.age >= 40 && guest.age <= 50
  json.extract! guest, :name, :favorite_color, :age
end
