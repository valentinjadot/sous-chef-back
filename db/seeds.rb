# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = %w[
  alejandro
  cristofer
  cecilia
  isa
  vane
  nacho
  ronny
  pablo
  juan
  carlos
  valentin
  manuii
]

students.each do |student|
  User.create!(name: student, fin: true)
end

vegans = %w[
  cristofer
  nacho
  ronny
]

User.where(name: vegans).update_all(vegan: true)
