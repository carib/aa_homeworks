class CreateResponsesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.integer :answer_id, null: false
      t.integer :user_id, null: false
      
      t.timestamps
    end
    add_index(:responses, :id)
  end
end
