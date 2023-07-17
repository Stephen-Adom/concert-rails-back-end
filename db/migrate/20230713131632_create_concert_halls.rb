class CreateConcertHalls < ActiveRecord::Migration[7.0]
  def change
    create_table :concert_halls do |t|
      t.integer :concert_id
      t.string :hall_name
      t.text :city_name
      t.datetime :date
      t.integer :total_seats
      t.integer :reserved_seats

      t.timestamps
    end
  end
end
