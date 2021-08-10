class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index "artists", ["name"], name: "index_artists_on_name", using: :btree
    add_index "artists", ["slug"], name: "index_artists_on_slug", unique: true, using: :btree
  end
end
