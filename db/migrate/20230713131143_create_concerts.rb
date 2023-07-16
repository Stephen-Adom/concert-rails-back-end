class CreateConcerts < ActiveRecord::Migration[7.0]
  def change
    create_table :concerts do |t|
      t.string :name
      t.string :band
      t.text :description
      t.integer :total_seats
      t.integer :reserved_seats
      t.string :artist
      t.text :image
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
