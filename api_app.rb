require 'http'

system 'clear'
puts "Welcome to the Dictionary!"
puts "What word would you like a definition for?:"
word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=10&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

top_example = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

pronunciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=5&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

audio = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=1&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

# puts JSON.pretty_generate(response.parse[1]["text"])

puts "DEFINITIONS: "
response.parse.each do |definition|
	puts JSON.pretty_generate("#{definition["text"]}")
end

puts "TOP EXAMPLE: "
puts JSON.pretty_generate(top_example.parse["text"])

puts "PRONUNCIATION: "
puts JSON.pretty_generate(pronunciation.parse[0]["raw"])

puts "AUDIO: "
`open #{audio.parse[0]["fileUrl"]}`

