# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  Band.destroy_all
  sabbath = Band.create!(name: "Black Sabbath")
  band2 = Band.create!(name: "Flower Travellin' Band")
  band3 = Band.create!(name: "Scratch Acid")
  band4 = Band.create!(name: "Danzig")

  Album.destroy_all
  paranoid_album = Album.create!(title: "Paranoid", year: 1970, band_id: sabbath.id)

  Track.destroy_all
  war_pigs = Track.create!(title: "War Pigs", ord: 1, band_id: sabbath.id, album_id: paranoid_album.id)
  paranoid = Track.create!(title: "Paranoid", ord: 2, band_id: sabbath.id, album_id: paranoid_album.id)
  planet_caravan = Track.create!(title: "Planet Caravan", ord: 3, band_id: sabbath.id, album_id: paranoid_album.id)
  iron_man = Track.create!(title: "Iron Man", ord: 4, band_id: sabbath.id, album_id: paranoid_album.id)
  electric_funeral = Track.create!(title: "Electric Funeral", ord: 5, band_id: sabbath.id, album_id: paranoid_album.id)
  hand_of_doom = Track.create!(title: "Hand of Doom", ord: 6, band_id: sabbath.id, album_id: paranoid_album.id)
  rat_salad = Track.create!(title: "Rat Salad", ord: 7, band_id: sabbath.id, album_id: paranoid_album.id)
  fairies_wear_boots = Track.create!(title: "Fairies Wear Boots", ord: 8, band_id: sabbath.id, album_id: paranoid_album.id)
end