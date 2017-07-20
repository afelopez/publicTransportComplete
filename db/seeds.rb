# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

12.times do |n|
  name  = Faker::Name.name
  email = "ronaldo-#{n+1}@yahoo.com"
  Client.create!(name: name, email: email)
end

8.times do |n|
  plate = ["ABC", "DFG"].sample + (0..9).to_a.sample.to_s + (0..9).to_a.sample.to_s + (0..9).to_a.sample.to_s  
  if plate[0..2] == "ABC"
  	category = 1
  else
  	category = 2
  end
  year = (1980..2017).to_a.sample
  color = ["blue", "white", "red", "black", "green", "pink", "yellow", "gray"].sample

  Vehicle.create!(category: category, plate: plate, year: year, color: color)
end

20.times do |n|
  name  = Faker::Address.city + " - " + Faker::Address.city
  distance = (100..5000).to_a.sample 
  time = (1..120).to_a.sample
  client_id = (1..12).to_a.sample
  vehicle_id = (2..9).to_a.sample
  
  Track.create!(name: name, distance: distance, time: time, client_id: client_id, vehicle_id: vehicle_id)
end