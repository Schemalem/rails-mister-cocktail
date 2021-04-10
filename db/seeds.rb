# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
Ingredient.create(name: "lime")
Ingredient.create(name: "light rum")
Ingredient.create(name: "gin")
Ingredient.create(name: "vodka")
Ingredient.create(name: "soda")
Ingredient.create(name: "coke")
Ingredient.create(name: "lemonade")


p "Deleting all doses"
Dose.destroy_all

p "Deleting all ingredients"
Ingredient.destroy_all

ingredient_url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(URI.open(ingredient_url).read)

ingredients.flatten[1].each do |array|
  ingredient = array.values.first.downcase
  p "Adding #{ingredient} to db"
  Ingredient.create(name: ingredient)
end

p "Deleting all cocktails"
Cocktail.destroy_all

2.times do
  cocktail_name = Faker::Hipster.sentence(word_count: 2, supplemental: false, random_words_to_add: 0).downcase
  p "Adding #{cocktail_name} to db"
  Cocktail.create(
    name: cocktail_name
  )
end

p "Creating doses"

Cocktail.all.each do |cocktail|
  num_of_ingredients = rand(2..4)
  ingredients = Ingredient.all.sample(num_of_ingredients)
  ingredients.each do |ingredient|
    description = "#{["25ml", "50ml", "dash", "shot", "cup"].sample}"
    cocktail.doses.create(description: description, ingredient: ingredient)
  end
end
