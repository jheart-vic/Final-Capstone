# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Victor')
User.create(name: 'Mentor')
User.create(name: 'Doctor')
User.create(name: 'Mortor')



Teacher.create!(name: 'John Doe', title: 'Maths', photo: 'albrt.jpg')
Teacher.create!(name: 'Chris', title: 'Geography', photo: 'albrt.jpg')