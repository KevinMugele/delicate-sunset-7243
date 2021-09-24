
require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  before :each do
    @airline1 = Airline.create!(name: "American Airlines")
    @flight1 = @airline1.flights.create!(number: 1, date: "10/23/21", departure_city: "Newark", arrival_city: "LA")
    @flight2 = @airline1.flights.create!(number: 2, date: "10/24/21", departure_city: "JFK", arrival_city: "Denver")
    @flight3 = @airline1.flights.create!(number: 3, date: "9/23/21", departure_city: "DC", arrival_city: "Seattle")
    @passenger1 = Passenger.create!(name: "Kevin", age: 30)
    @passenger2 = Passenger.create!(name: "Henry", age: 70)
    @passenger3 = Passenger.create!(name: "Khoi", age: 60)
    @passenger4 = Passenger.create!(name: "Andrew", age: 50)
    @passenger5 = Passenger.create!(name: "Kelsey", age: 40)
    @passenger6 = Passenger.create!(name: "Laura", age: 20)

    @pf1 = FlightPassenger.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
    @pf2 = FlightPassenger.create!(passenger_id: @passenger2.id, flight_id: @flight1.id)
    @pf3 = FlightPassenger.create!(passenger_id: @passenger3.id, flight_id: @flight2.id)
    @pf4 = FlightPassenger.create!(passenger_id: @passenger4.id, flight_id: @flight2.id)
    @pf5 = FlightPassenger.create!(passenger_id: @passenger5.id, flight_id: @flight3.id)
    @pf6 = FlightPassenger.create!(passenger_id: @passenger6.id, flight_id: @flight3.id)

    visit flights_path
  end

  describe 'user story 1: Flights Index Page' do
    it 'shows all flight numbers' do
      save_and_open_page
      within("#flight-#{@flight1.id}") do
        expect(page).to have_content(@flight1.number)
        expect(page).to have_content(@airline1.name)
        expect(page).to have_content(@passenger1.name)
        expect(page).to have_content(@passenger2.name)
      end

      within("#flight-#{@flight2.id}") do
        expect(page).to have_content(@flight2.number)
        expect(page).to have_content(@airline1.name)
        expect(page).to have_content(@passenger3.name)
        expect(page).to have_content(@passenger4.name)
      end

      within("#flight-#{@flight3.id}") do
        expect(page).to have_content(@flight3.number)
        expect(page).to have_content(@airline1.name)
        expect(page).to have_content(@passenger5.name)
        expect(page).to have_content(@passenger6.name)
      end
    end
  end
end
