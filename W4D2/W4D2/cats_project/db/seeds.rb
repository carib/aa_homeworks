# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  Cat.destroy_all
  cat1 = Cat.create!(birth_date: Date.new(2010, 3, 15), color: 'red', name: 'Cat One', sex: 'F', description: 'So cuddly.')
  cat2 = Cat.create!(birth_date: Date.new(2016, 10, 4), color: 'black', name: 'Cat Two', sex: 'M', description: 'A baby.')
  cat3 = Cat.create!(birth_date: Date.new(2005, 1, 12), color: 'salmon', name: 'Cat Three', sex: 'F', description: 'Dead shortly.')

  CatRentalRequest.destroy_all
  CatRentalRequest.create!(cat_id: cat1.id, start_date: Date.new(2003, 4, 2), end_date: Date.new(2003, 6, 3), status: 'PENDING')

  CatRentalRequest.create!(cat_id: cat1.id, start_date: Date.new(2003, 5, 2), end_date: Date.new(2003, 8, 3), status: 'APPROVED')

  CatRentalRequest.create!(cat_id: cat1.id, start_date: Date.new(2003, 3, 2), end_date: Date.new(2003, 12, 3), status: 'PENDING')

  CatRentalRequest.create!(cat_id: cat2.id, start_date: Date.new(2003, 6, 2), end_date: Date.new(2003, 7, 3), status: 'PENDING')

  CatRentalRequest.create!(cat_id: cat3.id, start_date: Date.new(2003, 1, 2), end_date: Date.new(2003, 1, 3), status: 'PENDING')
  CatRentalRequest.create!(cat_id: cat3.id, start_date: Date.new(2003, 2, 2), end_date: Date.new(2003, 2, 3), status: 'PENDING')
end
