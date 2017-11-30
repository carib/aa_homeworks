class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.boolean :bonus, default: false
      t.references :band, foreign_key: true
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
