class AddRequesterIdToCatRentalRequests < ActiveRecord::Migration[5.1]
  def change
    add_reference :cat_rental_requests, :user, index: true 
    add_foreign_key :cat_rental_requests, :users, null: false
  end
end
