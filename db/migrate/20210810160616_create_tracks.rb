class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.belongs_to :artist
      t.string :title
      t.string :slug
      t.text :lyrics

      t.timestamps
    end

    add_index :tracks, :title
    add_index :tracks, :slug, unique: true
  end
end
