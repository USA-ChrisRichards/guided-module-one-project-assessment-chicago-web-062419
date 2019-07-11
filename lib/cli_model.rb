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
        puts "*********************************************************************************"
        menu

        # puts "Enter a fighter name to get started:"
        # puts "Type first name here: "
        # input_first_name = gets.chomp
        # puts "Type last name here: "
        # input_last_name = gets.chomp
        # puts "*********************************************************************************"
        # # fighter_name = gets.chomp
        # # fighter_name.to_s
        # # p Competitor.find_by first_name: fighter_name
        # puts "Here are all of the events #{input_first_name} #{input_last_name} has participated in:"
        # fighter_name_events = Competitor.find_by(first_name: input_first_name, last_name: input_last_name).events
        # #fighter_name_events = Competitor.find_by(first_name: fighter_name, last_name: input_last_name).events
        # fighter_name_events.each {|e| p e}
        #iterate over the event details and puts out each. More organized and cleaner
        # puts "*********************************************************************************"
        # puts "Total events in UFC:"
        # p Competitor.joins(:events).count
        # puts "*********************************************************************************"
        # average_attendance
        # add_event
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

    # Competitor.find_by(first_name: 'Nik').events\

    # Competitor.joins(events).where(events: {'attendance 15000})

    # Competitor.where("orders_count = ?", params[:orders])

    
end
#CRUD
##########################################################################################
#CREATE:
#   need method for :create a new row for events(when new event occurs)
#       Event.create(id: event[:id], date: event[:date], city: event[:city], state: event[:state], venue: event[:venue], attendance: event[:attendance], gate: event[:gate])
# Create
# c = Competitor.new
# c.first_name = "Jon"
# c.last_name = "Jones"
# c.save
# Now you can just type i and it should show you that i has been inserted into the database and it has been assigned an ID number.
def add_event
    puts "Add an event by typing the required information below:"
    puts "Date(YYYY-MM-DD): "
    d = gets.chomp
    puts "City: "
    c = gets.chomp
    puts "State: "
    s = gets.chomp
    puts "Venue Name: "
    v = gets.chomp
    puts "Attendance: "
    att = gets.chomp
    puts "Gate($): "
    g = gets.chomp
    # Event.create(date: d, city: c, state: s, venue: v, attendance: a, gate: g)
    # new_event.save   ### commented to avoid save during testing
    puts "New event: #{d} #{c}, #{s}, #{v}, #{att}, #{g}"
    puts "Your added event has been saved! We thank you for your contribution."
    # Event.create(id: event[:id], date: event[:date], city: event[:city], state: event[:state], venue: event[:venue], attendance: event[:attendance], gate: event[:gate])
end
# Can we add competitors that have fought at this event???
##########################################################################################
#READ:
#   average_attendance, average_gate
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

 def competitors_events
    puts "Enter a fighter name to get started:"
        # puts "Type first name here: "
        # input_first_name = gets.chomp
        # puts "Type last name here: "
        # input_last_name = gets.chomp
        # puts "*********************************************************************************"
        # # fighter_name = gets.chomp
        # # fighter_name.to_s
        # # p Competitor.find_by first_name: fighter_name
        # puts "Here are all of the events #{input_first_name} #{input_last_name} has participated in:"
        # fighter_name_events = Competitor.find_by(first_name: input_first_name, last_name: input_last_name).events
        # #fighter_name_events = Competitor.find_by(first_name: fighter_name, last_name: input_last_name).events
        # fighter_name_events.each {|e| p e}
    fighter_name_events = Competitor.find_by(first_name: input_first_name, last_name: input_last_name).events
 end
##########################################################################################
#UPDATE:
#   need method for updating/changing fighter wins/losses or age...
#   To update a row, first you need to find it:
#   c = Competitor.find_by(last_name: "Jones")
#   And then assign whatever new values you want to:
#   c.wins = "20"
#   And then save.
#   c.save
#   That's it... But need to have more advanced query and user questions
##########################################################################################
#DESTROY:
#   delete a competitor when retired. remove entire row
#   delete mistakes/incorrect data inputs
###   Competitor.delete(name: user_input)
# To delete a row, first find it:
# c = Competitor.find(1)  ### finds row in Competitor by id
# And then,
# c.destroy

# puts "See and error or retired fighter?"
# delete_name = gets.chomp
# Competitor.where(last_name: "some name").destroy
## deletes one instance of Competitor with last name

##########################################################################################
###------Menu---------###
# Will need some code like:
def menu
    puts "MENU"
    puts "1. create something" 
    puts "2. read something" 
    puts "3. update something" 
    puts "4. destroy something"
    puts "5. exit"
    a = gets.chomp
        if a == "1"
            add_event
        elsif a == "2"
            puts "reading method"
        elsif a == "3"
            puts "update method"
        elsif a == "4"
            puts "destroy method"
        elsif a == "5"
            puts "Goodbye."
            puts "*****************************************************************************"
        elsif a == nil
            puts "Please select a valid option from Menu"
            # self.menu? nope. self? nope.
        else
            puts "Please select a valid option from Menu"
            self
        end
end
#   g = gets.chomp
#   if g == 1 
#       #some_method
#   end
### A user menu to choose different actions.





### this will remove "DEBUG" SQL statements from
module ActiveSupport
    class LogSubscriber
      def debug(*args, &block)
      end
    end
  end