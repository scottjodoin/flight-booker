class BookingPassenger < ApplicationRecord
  belongs_to :booking
  belongs_to :passenger
end
