class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :user
  has_many :passenger
end
