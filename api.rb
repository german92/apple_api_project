require 'rest-client'
require 'json'

puts "Welcome to Apple Searcher !"

puts "What kind of media would you like to search for? (music, movie or podcast)"
input = gets.strip

if (input == "music") 
	puts "Please enter the name of an artist"
	artist = gets.strip
	puts  "Loading songs…"
	response = RestClient.get("https://itunes.apple.com/search?term=#{artist}&media=#{input}&attribute=artistTerm")

elsif (input == "movie") 
	puts "Please enter the name of a movie:"
	movie = gets.strip
	puts "Loading movies"
	response = RestClient.get("https://itunes.apple.com/search?term=#{movie}&media=#{input}&attribute=movieTerm")

elsif (input == "podcast")
	puts "Please enter the name of a podcast:"
	podcast = gets.strip
	puts  "Loading podcasts"
	response = RestClient.get("https://itunes.apple.com/search?term=#{podcast}&media=#{input}&attribute=podcast")

else 
	puts "Sorry I didn’t get that. Try again!"

end

parsed_response=JSON.parse(response)



puts "#{parsed_response["results"]["trackName"]}"


# track= parsed_response["response"]["trackName"]



# puts track


# artistname = parsed_response["response"]["artistName"]
# trackurl =  parsed_response["response"]["trackViewUrl"]

# track.each_with_index do |tracks, index|
# 	puts "#{index + 1}, #{tracks["response"]}, #{tracks["response"]["artistname"]}, #{trackurl}"
# end
# artistname.each_with_index do |tracks, index|
# 	puts "#{index + 1}, #{tracks["response"]["artistName"]}"
# end
# trackurl.each_with_index do |tracks, index|
# 	puts "#{index + 1}, #{tracks["response"]["trackViewUrl"]}"
# end

