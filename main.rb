require 'pry'
require 'open-uri'
require 'json'

BASE_URL = "https://api.usa.gov/jobs/search.json?"

def search(query, state = "ny")
	puts "Welcome, enter a job type."
	query = gets.chomp
	puts "Enter a state:"
	state = gets.chomp
	x = JSON.parse(open("#{BASE_URL}query=#{query}+jobs+in+#{state}").read)
	puts "#{x[0]["position_title"]} - #{x[0]["locations"]}"
end

search("engineer")



# results = Yelp.client.search('San Francisco', { term: 'food' })
# puts results