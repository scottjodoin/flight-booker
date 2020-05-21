class Passenger < ApplicationRecord
  belongs_to :user
  has_many :flights, through: :bookings
end
