require 'http'

system 'clear'
puts "Welcome to the Dictionary!"
puts "What word would you like a definition for?:"
word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=10&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

puts JSON.pretty_generate(response.parse)

