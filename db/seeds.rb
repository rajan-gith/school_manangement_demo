# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

["First School", "Second School", "Third School"].each do |school|
  School.find_or_create_by(name: school)
end

Admin.find_or_initialize_by(email: "admin@gmail.com") do |admin|
  admin.password = 12345678 
  admin.password_confirmation = 12345678
  admin.save 
end