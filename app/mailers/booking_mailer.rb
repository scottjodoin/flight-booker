class BookingMailer < ApplicationMailer
  default from: "scottjodoin@gmail.com", host:
  
  
  def thank_you_email
    @booking = params[:booking]
    mail(to: @booking.named_emails, subject: "Your Flight Booking")
  end
end
