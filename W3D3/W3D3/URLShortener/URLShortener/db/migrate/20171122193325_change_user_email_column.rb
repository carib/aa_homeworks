class ChangeUserEmailColumn < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :email, false
    add_index :users, :email
  end
end
