class AddUserIdToCats < ActiveRecord::Migration[5.1]
  def change
    # add_column :cats, :user_id, :integer, null: false
    # add_foreign_key :cats, :users
    # add_index :cats, :user_id
    add_reference :cats, :user, index: true
    add_foreign_key :cats, :users
  end
end
