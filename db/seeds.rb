require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)

cocktail_names = [
  'Tequila Mockingbird',
  'Mastering Margarita',
  'The Old Man and the Seagram’s',
  'Bridget Jones’s Daiquiri',
  'The Last of the Mojitos',
  'The Rye in the Catcher',
  'Infinite Zest',
  'Whiskey Business',
  'The Picture Of Dorian Gray Goose',
  'Mad Mix: Fury Road']

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

cocktail_names.each do |cocktail|
  new_cock = Cocktail.new(name: cocktail)
  new_cock.remote_photo_url = 'https://picsum.photos/600/800/?random'
  new_cock.save
end
ingredients["drinks"].each_with_index { |k,v| Ingredient.create(name: k["strIngredient1"]) }
