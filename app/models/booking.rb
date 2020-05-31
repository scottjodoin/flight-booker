class Booking < ApplicationRecord
  belongs_to :flight
  has_and_belongs_to_many :passengers, inverse_of: :booking
  accepts_nested_attributes_for :passengers

  def named_emails
    passengers.map{|p| p.named_email }
  end
end
