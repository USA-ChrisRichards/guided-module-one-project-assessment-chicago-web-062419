require_relative '../config/environment'
# require_relative '../lib/cli_model.rb'

puts "hello world"

cli = CommandLineInterface.new
cli.greet


puts "Thinking of eating somewhere but not sure if it's good? We can help you with that decision!"
puts "Enter a fighter name to get started:"
fighter_name = gets.chomp
# Competitor.find_by(first_name: fighter_name)
puts "Here is the name: #{fighter_name}"