class PassengersController < ApplicationController
  def destroy
    if params[:flight_id]
      flight_passenger = FlightPassenger.find_by(passenger: params[:id], flight: params[:flight_id])
      flight_passenger.destroy!

      redirect_to flights_path
    end
  end
end
