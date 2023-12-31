# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
User.create(username: 'johndoe', password: '111111', password_confirmation: '111111', role: 'user', name: 'John Doe', email: 'johndoe@mail.com')

Concert.create(name: "RaveFactory", band: "Octopus", description: "Industrial vibes", artist: "Ocrum",  image: "https://res.cloudinary.com/dq6tzsvct/image/upload/v1689877013/concert-image-2_tytrjn.jpg")
ConcertHall.create(concert_id: 1,hall_name: "hall-1", city_name: "NY", date: "2024-02-02 21:00",total_seats: 100)
Reservation.create(user_id: 2, concert_hall_id: 1)

Concert.create(name: "BraveWorld",  band: "Shkoon", description: "Arabian vibes",  artist: "Ameen", image: "https://res.cloudinary.com/dq6tzsvct/image/upload/v1689877090/concert-3_jwbhjh.jpg")

ConcertHall.create(concert_id: 2,hall_name:'hall-2', city_name:'Paris', date: "2024-04-04 20:00",total_seats: 200)
Reservation.create(user_id: 2, concert_hall_id: 2)
