class AddForeignKeysToFlightPassengers < ActiveRecord::Migration[5.2]
  def change
    add_reference :flight_passengers, :flight, foreign_key: true
    add_reference :flight_passengers, :passenger, foreign_key: true
  end
end
