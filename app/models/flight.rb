class Flight < ApplicationRecord
  belongs_to :from, class_name: "Airport"
  belongs_to :to, class_name: "Airport"
  has_many :passengers, through: :bookings

  def to_s
    "#{from.code} to #{to.code}. " +
    "#{departure_time.strftime("%b %e, %l:%M%P")}-#{arrival_time.strftime("%l:%M%P")}"
  end
end
