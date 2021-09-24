class Airline < ApplicationRecord
  has_many :flights

  def adult_passengers
    flights.joins(flight_passengers: :passenger)
           .select('passengers.*, count(flight_passengers.id) AS flight_count')
           .where('passengers.age >= ?', 18)
           .group('passengers.id')
           .order('flight_count DESC')
           .distinct
  end
end
