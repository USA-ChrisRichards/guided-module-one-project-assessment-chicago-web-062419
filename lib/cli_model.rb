# a = Artii::Base.new
# a.asciify('word')

class CommandLineInterface < ActiveRecord::Migration[5.2]
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
        puts "Thinking of fighter's stats but not sure of something? We can help you with that decision!"
        puts "Enter a fighter name to get started:"
        fighter_name = gets.chomp
        fighter_name.to_s
        # p Competitor.find_by first_name: fighter_name
        p Competitor.find_by(first_name: fighter_name).events
        puts "Here is the name: #{fighter_name}"
        "----------------------------"
        puts Competitor.joins(:events).count

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

    # find a competitor's events
    #find Fights.event_id WHERE competitor_id
    #"Hazlett" fought in "Chicago"
    # Competitor.find_by_id 1 = first row in competitors table
    # def competitors_events

    # competitor's cities they fought in(were at an event)
    # def list_events
    #     fights.collect do |fight|
    #       "#{fight.competitor.id} +++ #{fight.event.venue}"
    #     end
    #   end

    #   Competitor.find_by(first_name: 'Nik').events
    
end
# cli = CommandLineInterface.new
# cli.run