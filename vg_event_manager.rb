# Dependencies
require "csv"

# Class Definition
class EventManager
  def initialize(filename = 'vg_event_attendees.csv')
    puts "EventManger Initialized"
    @file = CSV.open(filename, 'rb', {headers: true, header_converters: :symbol})
  end

  def print_names
     @file.each do |line|
       puts "#{line[:first_name]} #{line[:last_name]}"
    end
  end

end

# Script
manager = EventManager.new
manager.print_names
