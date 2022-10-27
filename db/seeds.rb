# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Teacher.create(name: 'Ama', title: 'Dango')
Teacher.create(name: 'Ema', title: 'Mango')
Teacher.create(name: 'Wam', title: 'Pango')
Teacher.create(name: 'Man', title: 'Sango')

1..(5.times do |i|
  Reservation.create(
    user_id: 1,
    city: "City #{i}",
    teacher_id: i,
    reservation_date: Date.today + i
  )
end)
