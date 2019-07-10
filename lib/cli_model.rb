class CommandLineInterface
    def greet
        puts 'Welcome to UFC Stat Tracker, the best resource for UFC information in the world!'
    end


    def run
        greet
        puts "Thinking of eating somewhere but not sure if it's good? We can help you with that decision!"
        puts "Enter a fighter name to get started:"
        fighter_name = gets.chomp
        fighter_name.to_s
        p Competitor.find_by first_name: fighter_name
        puts "Here is the name: #{fighter_name}"

        # binding.pry
     end
    #   # Request - Input

# puts "Thinking of the which events a fighter fought in? We can find an answer!"
# puts "Enter a fighter's name to get started:"
# competitor_name = gets.chomp
# puts "Here is #{competitor_name}"
# # What could we put here to allow a user to type a response?
# #### Do I need to have a full_name, or just name column instead of first/last...
# # Response - Output
# # take the user's input--a string of a competitor/event name--and use that competitor/event name to find events in our database. Then we want to print out the content of those events. However, to give a really good user experience, we will also want to print out the names of the users who wrote those reviews
# Competitor.find_by(first_name: competitor_name)
# # Competitor.where("wins > ?", 3)
# # Competitor.where("first_name == competitor_name")


end
# cli = CommandLineInterface.new
# cli.run