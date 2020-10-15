# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.destroy_all
Tag.destroy_all

50.times do |index|
  Recipe.create!(name: Faker::Food.dish,
                        instructions: Faker::Food.description,
                        ingredients: Faker::Food.ingredient,
                        rating: rand(1..5))
end


p "Created #{Recipe.count} recipes"

tag_list = ["Breakfast", "Lunch", "Dinner", "Dessert", "Fun", "Easy", "Intermediate", "Hard", "Soul-Crushing", "Gordon Ramsey Approved", "Dairy-free", "Vegan", "Gluten-Free", "Plant-Based Protein", "Freegan"]

tag_list.each do |name|
  Tag.create( name: name )
end