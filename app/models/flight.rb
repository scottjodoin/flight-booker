class Flight < ApplicationRecord
  belongs_to :from, class_name: "Airport"
  belongs_to :to, class_name: "Airport"
  has_many :bookings, inverse_of: :flight
  has_many :passengers, through: :bookings
  scope :future_departures_dates, ->{ select("DISTINCT date(departure_time) AS date").where("departure_time > CURRENT_TIMESTAMP").map(&:date)}
  
  def to_s
    "#{from.code} to #{to.code}. " +
    "#{departure_time.strftime("%b %e, %l:%M%P")}-#{arrival_time.strftime("%l:%M%P")}"
  end

  def self.search(search)
    return Flight.all if search.nil? or
    /^[A-Z]{3}/ !~ search[:to] or
    /^[A-Z]{3}/ !~ search[:from] or
    /^[0-9]+$/ !~ search[:passenger_count] or
    not search[:passenger_count].to_i.between?(1,10)

    from_code = search[:from][0..2]
    to_code = search[:to][0..2]

   

    return Flight.none unless Airport.exists?(code: from_code) and
      Airport.exists?(code: to_code)
    a1 = Airport.find_by(code: from_code) 
    a2 = Airport.find_by(code: to_code)
    return self.where(from: a1) if from_code == to_code
    return self.where(from: a1, to: a2) if /^\d{4}-\d{2}-\d{2}$/ !~ search[:date]

    date_time = DateTime.parse search[:date]
    self.where(from: a1, to: a2, departure_time: date_time.all_day)
  end
end
