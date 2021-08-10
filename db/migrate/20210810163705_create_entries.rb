class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.belongs_to :chart
      t.belongs_to :track
      t.integer :position, null: false

      t.timestamps
    end

    add_index :entries, [:chart_id, :position], unique: true
  end
end
