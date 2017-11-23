class EditAnswerChoice < ActiveRecord::Migration[5.1]
  def change
    add_reference :answer_choices, :question, foreign_key: true, null: false
  end
end
