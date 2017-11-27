# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create!(username: "Barnaby")
  user2 = User.create!(username: "Carnival")
  user3 = User.create!(username: "Danzig")
  user4 = User.create!(username: "Elefun")
  user5 = User.create!(username: "Lux Interior")
  
  Artwork.destroy_all
  artwork1 = Artwork.create!(artist_id: user1.id, image_url: 'www.com1.com', title: 'stop')
  artwork2 = Artwork.create!(artist_id: user2.id, image_url: 'www.com2.com', title: 'stop it')
  artwork3 = Artwork.create!(artist_id: user3.id, image_url: 'www.com3.com', title: 'stop now')
  artwork4 = Artwork.create!(artist_id: user4.id, image_url: 'www.com4.com', title: 'stopping')
  artwork5 = Artwork.create!(artist_id: user5.id, image_url: 'www.com5.com', title: 'stop n shop')
  artwork6 = Artwork.create!(artist_id: user1.id, image_url: 'www.com6.com', title: 'stop sign')
  artwork7 = Artwork.create!(artist_id: user2.id, image_url: 'www.com7.com', title: 'stopper')
  artwork8 = Artwork.create!(artist_id: user3.id, image_url: 'www.com8.com', title: 'stop or i will shoot')
  artwork9 = Artwork.create!(artist_id: user4.id, image_url: 'www.com9.com', title: 'please stop')
  artwork10 = Artwork.create!(artist_id: user5.id, image_url: 'www.com10.com', title: 'stop hammertime')
  artwork11 = Artwork.create!(artist_id: user1.id, image_url: 'www.com11.com', title: 'stop stopping')
  
  ArtworkShare.destroy_all
  ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user5.id)
  ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user4.id)
  ArtworkShare.create!(artwork_id: artwork9.id, viewer_id: user3.id)
  ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: user2.id)
  ArtworkShare.create!(artwork_id: artwork5.id, viewer_id: user1.id)
  ArtworkShare.create!(artwork_id: artwork5.id, viewer_id: user4.id)
  ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user4.id)
  ArtworkShare.create!(artwork_id: artwork8.id, viewer_id: user5.id)
  ArtworkShare.create!(artwork_id: artwork7.id, viewer_id: user5.id)
  ArtworkShare.create!(artwork_id: artwork10.id, viewer_id: user1.id)
  ArtworkShare.create!(artwork_id: artwork11.id, viewer_id: user5.id)
  
  Comment.destroy_all
  Comment.create!(artwork_id: artwork1.id, user_id: user5.id, body: "Good!")
  Comment.create!(artwork_id: artwork2.id, user_id: user4.id, body: "Bad! :(")
end
