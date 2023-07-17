# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

Concert.create(name: "RaveFactory", band: "Schkoon", description: "Arabian vibes",  artist: "Amine", image: "unsplash.com/img/1")
ConcertHall.create(concert_id: 1,hall_name: "hall-1", city_name: "NY", date: "2024-02-02 21:00",total_seats: 100)
# Reservation.create(user_id: 1, concert_hall_id: 1)

<<<<<<< HEAD
Concert.create(name: "BraveWorld", band: "Octopus", description: "Industrial vibes", total_seats: 100, artist: "Ocrum", image: "unsplash.com/img/2")
City.create(name: "NY")
ConcertHall.create(concert_id: 2, city_id: 2, date: "2024-04-04")
ConcertHall.create(concert_id: 2, city_id: 1, date: "2024-04-04")
Reservation.create(user_id: 1, concert_hall_id: 2)
=======
Concert.create(name: "BraveWorld", band: "Octopus", description: "Industrial vibes", artist: "Ocrum", image: "unsplash.com/img/2")

ConcertHall.create(concert_id: 2,hall_name:'hall-2', city_name:'paris', date: "2024-04-04 20:00",total_seats: 200)
# Reservation.create(user_id: 1, concert_hall_id: 2)
>>>>>>> dev
