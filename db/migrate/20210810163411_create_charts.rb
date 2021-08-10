class CreateCharts < ActiveRecord::Migration[6.1]
  def change
    create_table :charts do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :charts, :name
    add_index :charts, :slug, unique: true
  end
end
