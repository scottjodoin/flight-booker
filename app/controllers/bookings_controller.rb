class BookingsController < ApplicationController

  def new
    redirect_to render_404 unless Flight.exists?(booking_params[:flight_id])
    @booking = Booking.new
    @flight = Flight.find(booking_params[:flight_id])
    @passenger_count = booking_params[:passenger_count].to_i
    @booking.passengers = Array.new(params[:passenger_count].to_i, Passenger.new)
  end

  def create
     @flight = Flight.find(params_for_create[:flight_id]) or raise("not found") or not_found
     @flight.bookings.build
     @booking = @flight.bookings.last
     params_for_create[:passengers_attributes].each_pair do |i, passenger_info|
        @booking.passengers.build(passenger_info)
     end
     if (@flight.save)
      redirect_to @booking
      BookingMailer.with(booking: @booking).thank_you_email.deliver_later
     end
  end

  def show
    @booking = Booking.includes(:passengers, flight: [:to, :from]).find_by(id: params_for_show[:id]) or not_found
  end

  private

  def not_found
    raise ActionController::RoutingError.new("Not Found")
    render text: "Not Found", status: "404"
  end

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
