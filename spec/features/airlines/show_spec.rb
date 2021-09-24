require 'rails_helper'

RSpec.describe 'Airlines Showw Page' do
  before :each do
    @airline1 = Airline.create!(name: "American Airlines")
    @flight1 = @airline1.flights.create!(number: 1, date: "10/23/21", departure_city: "Newark", arrival_city: "LA")
    @flight2 = @airline1.flights.create!(number: 2, date: "10/24/21", departure_city: "JFK", arrival_city: "Denver")
    @flight3 = @airline1.flights.create!(number: 3, date: "9/23/21", departure_city: "DC", arrival_city: "Seattle")
    @passenger1 = Passenger.create!(name: "Kevin", age: 30)
    @passenger2 = Passenger.create!(name: "Khoi", age: 6)
    @passenger3 = Passenger.create!(name: "Andrew", age: 5)
    @passenger4 = Passenger.create!(name: "Kelsey", age: 40)
    @passenger5 = Passenger.create!(name: "Laura", age: 18)

    @pf1 = FlightPassenger.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
    @pf2 = FlightPassenger.create!(passenger_id: @passenger3.id, flight_id: @flight2.id)
    @pf3 = FlightPassenger.create!(passenger_id: @passenger4.id, flight_id: @flight2.id)
    @pf4 = FlightPassenger.create!(passenger_id: @passenger5.id, flight_id: @flight1.id)
    @pf5 = FlightPassenger.create!(passenger_id: @passenger5.id, flight_id: @flight3.id)
    @pf6 = FlightPassenger.create!(passenger_id: @passenger1.id, flight_id: @flight3.id)
    @pf7 = FlightPassenger.create!(passenger_id: @passenger5.id, flight_id: @flight2.id)
    @pf8 = FlightPassenger.create!(passenger_id: @passenger5.id, flight_id: @flight3.id)

    visit airline_path(@airline1)
  end

  describe 'user story 3: Airlines passenger' do
    it 'shows all passengers on the airlines flights that are older than 18 and unique' do
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger4.name)
      expect(page).to have_content(@passenger5.name)
      expect(page).to_not have_content(@passenger2.name)
      expect(page).to_not have_content(@passenger3.name)
    end
  end

  describe 'Extension: Frequent Flyers' do
    it 'should show flyers who have the most flights sorted most to least' do
      expect(@passenger5.name).to appear_before(@passenger1.name)
      expect(@passenger1.name).to appear_before(@passenger4.name)
    end
  end
end
