class FlightsController < ApplicationController
  before_action :set_flight, only: [:show]

  def index
    @search = search_params.to_h
    @airport_codes = Airport.all.map{|a| ["#{a.code}: #{a.name.truncate(30)}", a.code]}
    @search_dates = Flight.future_departures_dates
    @flights = Flight.search(search_params).includes(:from, :to)
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def book
    passenger_count = params[:passenger_count].to_i
    @flight = Flight.find params[:id]
    @passengers = Array.new(passenger_count, @flight.passengers.build)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:from, :to, :passenger_count, :date, passengers_attributes:[:id, :name, :email])
    end

    def search_params
      params.require(:search).permit(:from, :to, :passenger_count, :date)
    end
end
