class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flight = Flight.find(booking_params[:flight_id])
    @passenger_count = booking_params[:passenger_count].to_i
    @booking.passengers = Array.new(params[:passenger_count].to_i, Passenger.new)
  end

  # POST /bookings
  # POST /bookings.json
  def create
     @flight = Flight.find(params_for_create[:flight_id])
     @flight.bookings.build
     @booking = @flight.bookings.last
     params_for_create[:passengers_attributes].each_pair do |i, passenger_info|
        @booking.passengers.build(passenger_info)
     end
     @flight.save
     redirect_to @booking
  end

  def show
    @booking = Booking.includes(:passengers, flight: [:to, :from]).find_by(id: params_for_show[:id])
  end
  private

  def booking_params
    params.permit(:flight_id, :passenger_count)
  end

  def params_for_create
    params.require(:booking).permit(:flight_id, passengers_attributes:[:name, :email])
  end

  def params_for_show
    params.permit(:id)
  end
end
