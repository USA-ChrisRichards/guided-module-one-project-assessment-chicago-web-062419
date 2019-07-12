class CommandLineInterface < ActiveRecord::Migration[5.2]
    def greet
        puts 'Welcome to UFC Stat Tracker™, the best resource for UFC information in the world!'
    end
    def star_break
        puts "**********************************************************************************************************************************"
    end

    def run
        greet
        star_break
        menu
        star_break
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
end 

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

 def view_all_competitors
    Competitor.all.each do |c|
        puts "First Name: #{c.first_name}, Last Name: #{c.last_name}, Gender: #{c.gender}, Weight(lbs): #{c.weight_in_lbs}, Height(in): #{c.height_in_inches}, Reach(in): #{c.reach_in_inches}, Age: #{c.age}, Wins: #{c.wins}, Losses: #{c.losses}"
    end
 end

 def ask_for_name
    puts "Type first name here: "
    @input_first_name = gets.chomp
    puts "Type last name here: "
    @input_last_name = gets.chomp
 end
 #TODO: add a response to user if no competitor is found, dont want to see error in cli...
 def competitors_events
    puts "Enter a fighter name to get started:"
        ask_for_name
        star_break
        puts "Here are all of the events #{@input_first_name} #{@input_last_name} has participated in:"
        fighter_name_events = Competitor.find_by(first_name: @input_first_name, last_name: @input_last_name).events
        fighter_name_events.each do |e|
            puts "Date: #{e.date}, City: #{e.city}, State: #{e.state}, Venue: #{e.venue}, Attendance: #{e.attendance}, Gate: #{e.gate}"
        end
 end
##########################################################################################
#!UPDATE:

def update_wins_by_competitor_name
  ask_for_name
  c = Competitor.find_by(first_name: @input_first_name, last_name: @input_last_name)
  puts "Enter the updated win total here:"
  new_wins = gets.chomp
  c.wins = new_wins
  c.save
  puts "Updated win total of #{new_wins} has been saved!"
end
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
ask_for_name
c = Competitor.where(first_name: @input_first_name, last_name: @input_last_name)
c.destroy_all
puts "#{@input_first_name} #{@input_last_name} has been removed"
# deletes one instance of Competitor with matching name
end

################################################################################################
###*------Menu---------###
def menu
    star_break
    puts
    menu_design
    puts 
    star_break
    a = gets.chomp
        if a == "1"   #CREATE
            add_event
            star_break
            menu
        elsif a == "2"  #READ
            competitors_events
            star_break 
            menu
        elsif a == "3" #UPDATE
            update_wins_by_competitor_name
            star_break
            menu
        elsif a == "4" #DESTROY
            remove_competitor
            star_break
            menu
        elsif a == "5" #CREATE
            add_fighter
            star_break
            menu
        elsif a == "6" #CREATE
            link_competitor_and_event
            star_break
            menu
        elsif a == "7" #CREATE
            view_all_competitors
            star_break
            menu    
        elsif a == "8" #CREATE
            average_attendance
            star_break
            menu        
        elsif a == "0"
            puts "Goodbye!"
            %x( say 'GoodBye!' )
            star_break
        elsif a == nil
            puts "Please select a valid option from Menu"
            star_break
            menu
        else
            puts "Please select a valid option from Menu"
            star_break
            menu
        end
end
# TODO: Build a method to associate event with competitor... create new fight object to show relationship with event_id and competitor_id?

#* ufc194 = Event.find_by_date("2015-12-12") ### id=13
#* ufc194_id = ufc194[:id]
#?
#? input_event_id = input_event[:id]
#* conor = Competitor.find_by_last_name("McGregor") ### id=32
#assign id to variable...
#? input_competitor_id = input_competitor[:id]
#* conor_id = conor[:id] => 32
# Both variables above will store our objects wanting to connect through fights table
# Both of those objects have already been connected by seperate method.
#* Fight.create(event_id: conor_id, competitor_id: ufc194_id)
# This will create the row in join table assigning it a new id in order.
# Builds the relationship between competitor and event...
#? How do I gets.chomp(user input) and use the 2 ids to create fights row.
#TODO: link_competitor_event type error line 241. implicit conv of symbol into int
def link_competitor_and_event
    ask_for_name
    c = Competitor.where(first_name: @input_first_name, last_name: @input_last_name)
    puts "Enter the date of the event your fighter competed in(YYYY-MM-DD):"
    input_date = gets.chomp
    e = Event.find_by_date(input_date)
    Fight.create(event_id: e[:id], competitor_id: c[:id])
end
 

def menu_design
    puts "|_________|____MENU____|__________________________________|"
    puts "|  1. Add a missing UFC Event                             |"
    puts "|  2. See which UFC events a Competitor has been in       |"
    puts "|  3. Update an existing fighters win total               |"
    puts "|  4. Remove a Competitor from list                       |"
    puts "|  5. Add a Competitor to our list                        |"
    puts "|  6*. Link a Competitor to an Event they participated in |"
    puts "|  7. View all Competitors                                |"
    puts "|  8. View Average Attendance at all UFC events           |"
    puts "|  0. Exit                                                |"
    puts "|_________________________________________________________|"
end





###! DONT TYPE BELOW  ##########################################################################
### !this will remove "DEBUG" SQL statements from cli
module ActiveSupport
    class LogSubscriber
      def debug(*args, &block)
      end
    end
  end