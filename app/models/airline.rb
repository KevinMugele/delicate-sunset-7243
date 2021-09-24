class Airline < ApplicationRecord
  has_many :flights

  def adult_passengers
    flights.joins(flight_passengers: :passenger)
           .select('passengers.*')
           .where('passengers.age >= ?', 18)
           .group('passengers.id')
           .distinct
  end
end
