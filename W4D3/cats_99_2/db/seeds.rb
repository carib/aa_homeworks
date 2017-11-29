# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create!(username: 'winnie', password: 'nopants')
  user2 = User.create!(username: 'eeyore', password: 'solonely')
  
  Cat.destroy_all
  cat1 = Cat.create!(birth_date: Date.new(2010, 3, 15), color: 'red', name: 'Cat One', sex: 'F', description: 'So cuddly.', user_id: user1.id)
  cat2 = Cat.create!(birth_date: Date.new(2016, 10, 4), color: 'black', name: 'Cat Two', sex: 'M', description: 'A baby.', user_id: user1.id)
  cat3 = Cat.create!(birth_date: Date.new(2005, 1, 12), color: 'salmon', name: 'Cat Three', sex: 'F', description: 'Dead shortly.', user_id: user2.id)
  cat4 = Cat.create!(birth_date: Date.new(2017, 1, 12), color: 'red', name: 'Fuzzy', sex: 'M', description: 'Fuzzy cat!', user_id: user2.id)
  cat5 = Cat.create!(birth_date: Date.new(2030, 1, 12), color: 'brown', name: 'Happy', sex: 'F', description: 'Happy cat!', user_id: user2.id)

  CatRentalRequest.destroy_all
  # CatRentalRequest.create!(cat_id: cat1.id, start_date: Date.new(2003, 4, 2), end_date: Date.new(2003, 6, 3), status: 'PENDING')
  # 
  # 
  # CatRentalRequest.create!(cat_id: cat1.id, start_date: Date.new(2003, 3, 2), end_date: Date.new(2003, 12, 3), status: 'PENDING')
  CatRentalRequest.create!(cat_id: cat1.id, start_date: Date.new(2003, 5, 2), end_date: Date.new(2003, 8, 3), status: 'APPROVED', user_id: user2.id)
  CatRentalRequest.create!(cat_id: cat2.id, start_date: Date.new(2003, 6, 2), end_date: Date.new(2003, 7, 3), status: 'PENDING', user_id: user2.id)

  CatRentalRequest.create!(cat_id: cat4.id, start_date: Date.new(2003, 1, 2), end_date: Date.new(2003, 1, 3), status: 'PENDING', user_id: user1.id)
  CatRentalRequest.create!(cat_id: cat5.id, start_date: Date.new(2003, 2, 2), end_date: Date.new(2003, 2, 3), status: 'PENDING', user_id: user1.id)
end