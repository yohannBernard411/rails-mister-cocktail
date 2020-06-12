require 'json'
require 'open-uri'

fill_ingredients = true
fill_cocktails = true
fill_doses = false

# generate Ingredients
if fill_ingredients
  puts "please wait we load some ingredient for best cocktails"
  Ingredient.destroy_all
  url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
  me_serialized = open(url).read
  me = JSON.parse(me_serialized)
  me["drinks"].each do |drink|
    puts drink["strIngredient1"]
    Ingredient.create(name: drink["strIngredient1"])
  end
  puts "It's in DB! Now you can add ingredients in cocktails!!!"
end

# generate Cocktails
if fill_cocktails
  puts "please wait we load some ingredient for best cocktails"
  Cocktail.destroy_all
  20.times do
    url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
    me_serialized = open(url).read
    me = JSON.parse(me_serialized)
    puts me["drinks"][0]["strDrink"]
    Cocktail.create(name: me["drinks"][0]["strDrink"])
  end
  puts "It's in DB! Now you can drink lots of cocktails!!!"
end


