class RemoveNameColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :name
    
    rename_column :users, :email, :username
  end
end
