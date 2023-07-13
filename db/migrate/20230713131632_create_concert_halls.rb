class CreateConcertHalls < ActiveRecord::Migration[7.0]
  def change
    create_table :concert_halls do |t|
      t.integer :concert_id
      t.integer :city_id
      t.date :date

      t.timestamps
    end
  end
end
