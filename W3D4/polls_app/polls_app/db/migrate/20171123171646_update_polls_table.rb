class UpdatePollsTable < ActiveRecord::Migration[5.1]
  def change
    add_reference(:polls, :user, foreign_key: true)
  end
end
