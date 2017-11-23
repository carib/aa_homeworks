class EditQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :poll, foreign_key: true, null: false
  end
end
