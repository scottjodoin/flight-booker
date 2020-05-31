class Passenger < ApplicationRecord
  has_and_belongs_to_many :bookings
  has_many :flights, through: :bookings

  def named_email
    return %("#{name} <#{email}>")
  end
end
