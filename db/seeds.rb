require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

ingredients["drinks"].each_with_index { |k,v| Ingredient.create(name: k["strIngredient1"]) }
