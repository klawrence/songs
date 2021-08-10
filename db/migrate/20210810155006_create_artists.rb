class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :artists, :name
    add_index :artists, :slug, unique: true
  end
end
