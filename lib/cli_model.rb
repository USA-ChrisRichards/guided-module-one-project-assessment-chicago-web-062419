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
        puts "*********************************************************************************"
        menu
        puts "*********************************************************************************"

        # puts "Enter a fighter name to get started:"
        # puts "Type first name here: "
        # input_first_name_name = gets.chomp
        # puts "Type last name here: "
        # input_last_name_name = gets.chomp
        # puts "*********************************************************************************"
        # # fighter_name = gets.chomp
        # # fighter_name.to_s
        # # p Competitor.find_by first_name: fighter_name
        # puts "Here are all of the events #{input_first_name_name} #{input_last_name_name} has participated in:"
        # fighter_name_events = Competitor.find_by(first_name: input_first_name_name, last_name: input_last_name_name).events
        # #fighter_name_events = Competitor.find_by(first_name: fighter_name, last_name: input_last_name_name).events
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
#!CREATE:
#   need method for :create a new row for events(when new event occurs)
#       Event.create(id: event[:id], date: event[:date], city: event[:city], state: event[:state], venue: event[:venue], attendance: event[:attendance], gate: event[:gate])
# Create
# c = Competitor.new
# c.first_name = "Jon"
# c.last_name = "Jones"
# c.save
def ask_for_fighter_info
    competitor_hash = {}
    puts "Add a fighter by typing the required information below:"
    puts "First Name: "
    competitor_hash[:first_name] = gets.chomp
    puts "Last Name: "
    competitor_hash[:last_name] = gets.chomp
    puts "Gender(M/F): "
    competitor_hash[:gender] = gets.chomp
    puts "Weight(lbs): "
    competitor_hash[:weight_in_lbs] = gets.chomp
    puts "Height(inches): "
    competitor_hash[:height_in_inches] = gets.chomp
    puts "Reach(inches): "
    competitor_hash[:reach_in_inches] = gets.chomp
    puts "Age: "
    competitor_hash[:age] = gets.chomp
    puts "Wins: "
    competitor_hash[:wins] = gets.chomp
    puts "Losses: "
    competitor_hash[:losses] = gets.chomp
    competitor_hash
end #TODO: refactor competitor_hash[:each_attr] = gets.chomp

def add_fighter
    Competitor.create(ask_for_fighter_info)
    menu
    
end
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
    Event.create(date: d, city: c, state: s, venue: v, attendance: att, gate: g)
    puts "New event: #{d} #{c}, #{s}, #{v}, #{att}, $#{g}"
    puts "Your added event has been saved! We thank you for your contribution."
    # Event.create(id: event[:id], date: event[:date], city: event[:city], state: event[:state], venue: event[:venue], attendance: event[:attendance], gate: event[:gate])
end
# Can we add competitors that have fought at this event???
##########################################################################################
#!READ:
#   average_attendance, average_gate
def average_attendance
    avg = Event.average("attendance")
    avg = avg.round
    puts "The average UFC event had approximately #{avg} people in attendance!"
    menu
 end

 def average_gate
    avg = Event.average("gate")
    avg = avg.round
    puts "The average UFC event brought in approximately $#{avg}!"
    menu
 end

 def ask_for_name
    puts "Type first name here: "
    @input_first_name = gets.chomp
    puts "Type last name here: "
    @input_last_name = gets.chomp
 end
 def competitors_events
    puts "Enter a fighter name to get started:"
        ask_for_name
        puts "*********************************************************************************"
        puts "Here are all of the events #{@input_first_name} #{@input_last_name} has participated in:"
        fighter_name_events = Competitor.find_by(first_name: @input_first_name, last_name: @input_last_name).events
        fighter_name_events.each do |e|
            puts "Date: #{e.date}, City: #{e.city}, State: #{e.state}, Venue: #{e.venue}, Attendance: #{e.attendance}, Gate: #{e.gate}"
        end
 end
##########################################################################################
#!UPDATE:
#   need method for updating/changing fighter wins/losses or age...
#   To update a row, first you need to find it:
def update_wins_by_competitor_name
  ask_for_name
  c = Competitor.find_by(first_name: @input_first_name, last_name: @input_last_name)
  puts "Enter the updated win total here:"
  new_wins = gets.chomp
  c.wins = new_wins
  c.save
  puts "Updated win total of #{new_wins} has been saved!"
end
#   That's it... But need to have more advanced query and user questions
##########################################################################################
#!DESTROY:
#   delete a competitor when retired. remove entire row
#   delete mistakes/incorrect data inputs
###   Competitor.delete(name: user_input)
# To delete a row, first find it:
# c = Competitor.find(1)  ### finds row in Competitor by id
# And then,
# c.destroy
def remove_competitor
puts "Delete fighter by entering the required information below"
puts "---------------------------------------------------------------------------------------"
# puts "Enter their first name:"
# input_first_name = gets.chomp
# puts "Enter their last name:"
# input_last_name = gets.chomp
ask_for_name
c = Competitor.where(first_name: @input_first_name, last_name: @input_last_name)
c.destroy_all
puts "#{@input_first_name} #{@input_last_name} has been removed"
# deletes one instance of Competitor with last name
end

##########################################################################################
###------Menu---------###
# Will need some code like:
def menu
    puts "MENU"
    puts "1. Add a missing UFC Event" 
    puts "2. See which UFC events a specific fighter has been in" 
    puts "3. Update an existing fighters win total" 
    puts "4. Remove a Competitor from list"
    puts "5. Add a Competitor to our list"
    puts "6. Exit"
    a = gets.chomp
        if a == "1"   #CREATE
            add_event
            puts "*********************************************************************************"
            menu
        elsif a == "2"  #READ
            competitors_events
            puts "*********************************************************************************" 
            menu
        elsif a == "3"
            update_wins_by_competitor_name
            puts "*********************************************************************************"
            menu
        elsif a == "4"
            remove_competitor
            puts "*********************************************************************************"
            menu
        elsif a == "5"
            add_fighter
            puts "*********************************************************************************"
            menu    
        elsif a == "6"
            puts "Goodbye."
            puts "*********************************************************************************"
        elsif a == nil
            puts "Please select a valid option from Menu"
            puts "*********************************************************************************"
            menu
        else
            puts "Please select a valid option from Menu"
            puts "*********************************************************************************"
            menu
        end
end






### this will remove "DEBUG" SQL statements from
module ActiveSupport
    class LogSubscriber
      def debug(*args, &block)
      end
    end
  end