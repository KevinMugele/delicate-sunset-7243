
require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  before :each do
    @airline1 = Airline.create!(name: "American Airlines")
    @flight1 = @airline1.create!(number: 1, date: "10/23/21", departure_city: "Newark", arrival_city: "LA")
    @flight2 = @airline1.create!(number: 2, date: "10/24/21", departure_city: "JFK", arrival_city: "Denver")
    @flight3 = @airline1.create!(number: 3, date: "9/23/21", departure_city: "DC", arrival_city: "Seattle")
    @passenger1 = Passenger.create!(name: "Kevin", age: 30)
    @passenger2 = Passenger.create!(name: "Henry", age: 70)
    @passenger3 = Passenger.create!(name: "Khoi", age: 60)
    @passenger4 = Passenger.create!(name: "Andrew", age: 50)
    @passenger5 = Passenger.create!(name: "Kelsey", age: 40)
    @passenger6 = Passenger.create!(name: "Laura", age: 20)

    @pf1 = PassengerFlight.create!(passenger: @passenger1.id, flight: @flight1.id)
    @pf2 = PassengerFlight.create!(passenger: @passenger2.id, flight: @flight1.id)
    @pf3 = PassengerFlight.create!(passenger: @passenger3.id, flight: @flight2.id)
    @pf4 = PassengerFlight.create!(passenger: @passenger4.id, flight: @flight2.id)
    @pf5 = PassengerFlight.create!(passenger: @passenger5.id, flight: @flight3.id)
    @pf6 = PassengerFlight.create!(passenger: @passenger6.id, flight: @flight3.id)
  end


end
