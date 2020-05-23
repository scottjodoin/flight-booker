# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport.destroy_all
@airport_list = Airport::AIRPORT_LIST
@airport_list.each do |name, code|
  Airport.create( name: name, code: code)
end

def create_random_flight(date)
  a2 = a1 = @airport_list.sample.last
  while a2 == a1 do
    a2 = @airport_list.sample.last
  end
  departure = date + rand(22 * 60).minutes
  arrival = departure + (rand(3 * 60) + 60).minutes
  cost = rand(20000..40000)
  Flight.new(
    from: Airport.find_by(code: a1),
    to: Airport.find_by(code: a2),
    cost: cost,
    passenger_capacity: 30,
    departure_time: departure,
    arrival_time: arrival
  )
end

date = DateTime.now()
t = Time.now
print "-- seed flights "
ActiveRecord::Base.transaction do  #speeds up transaction from 17.5s to 1.6s! Wow!
  20.times do |i|
    print "."
    40.times do
      flight = create_random_flight(date)
      flight.save
    end
    date = DateTime.now + i.days
  end
end
puts "\n   -> #{Time.now - t}"