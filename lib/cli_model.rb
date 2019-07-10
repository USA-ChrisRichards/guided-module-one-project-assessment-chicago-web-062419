# a = Artii::Base.new
# a.asciify('word')

class CommandLineInterface
    def greet
        puts 'Welcome to UFC Stat Tracker, the best resource for UFC information in the world!'
    end

    # def show_events(events)
    #     events.each do |review|
    #       # How could we output this review's content and the username associated with it?
    #     end
    #   end


    def run
        greet
        # puts a.asciify('Welcome')
        puts "Thinking of eating somewhere but not sure if it's good? We can help you with that decision!"
        puts "Enter a fighter name to get started:"
        fighter_name = gets.chomp
        fighter_name.to_s
        puts Competitor.find_by first_name: fighter_name
        puts "Here is the name: #{fighter_name}"
        average_attendance
        average_gate
        # binding.pry
     end
  
     def average_attendance
        avg = Event.average("attendance")
        avg = avg.round
        puts "The average UFC event had approximately #{avg} people in attendance!"
     end

     def average_gate
        avg = Event.average("gate")
        avg = avg.round
        puts "The average UFC event brought in approximately $#{avg}!"
     end

    #  def find_competitor_by_first_name(fighter_name)
    #     puts Competitor.find_by first_name: fighter_name
    #  end

end
# cli = CommandLineInterface.new
# cli.run