# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
v1 = Venue.find(1)
v2 = Venue.find(2)
v3 = Venue.find(3)
v4 = Venue.find(4)
v5 = Venue.find(5)
v6 = Venue.find(6)

t1 = Timeslot.find(1)
t2 = Timeslot.find(2)
t3 = Timeslot.find(3)
t4 = Timeslot.find(4)
t5 = Timeslot.find(5)
t6 = Timeslot.find(6)

t1.venues << [v1, v2, v3, v4, v5]
t2.venues << [v1, v3, v5]
t3.venues << [v2, v4, v6]
t4.venues << [v1, v2, v4, v5]
t5.venues << [v1, v2, v3, v4, v5]
t6.venues << [v1, v3, v5]
