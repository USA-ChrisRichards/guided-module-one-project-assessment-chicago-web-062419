require_relative '../config/environment'

puts "hello world"

cli = CommandLineInterface.new
cli.greet

# Request - Input

puts "Thinking of the last event a fighter fought in? We can help you with that decision!"
puts "Enter a fighter's name to get started:"
competitor_name = gets.chomp
puts "Here is #{competitor_name}"
# What could we put here to allow a user to type a response?

# Response - Output
# take the user's input--a string of a competitor/event name--and use that competitor/event name to find events in our database. Then we want to print out the content of those events. However, to give a really good user experience, we will also want to print out the names of the users who wrote those reviews
Competitor.find_by(first_name: competitor_name)

