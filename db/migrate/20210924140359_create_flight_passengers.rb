class CreateFlightPassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_passengers do |t|
      t.integer :number
      t.string :date
      t.string :departure_city
      t.string :arrival_city
      t.references :passengers, foreign_key: true
      t.references :flights, foreign_key: true
    end
  end
end
