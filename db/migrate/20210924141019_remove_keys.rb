class RemoveKeys < ActiveRecord::Migration[5.2]
  def change
    def change
      remove_reference :flight_passengers, :passengers, index: true, foreign_key: true
      remove_reference :flight_passengers, :flights, index: true, foreign_key: true
    end
  end
end
