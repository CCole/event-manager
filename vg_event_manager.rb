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
  
  def clean_number(original_number)
      clean_number = original_number.delete(".,(, ),").delete("-").delete(" ")
  	
  	if clean_number.length == 10 
  		# Do Nothing
  	elsif clean_number.length == 11
  		if clean_number.start_with?("1") 
  			clean_number = clean_number[1..-1]
  		else
  			clean_number = "0000000000"
  		end
  	else
  		clean_number = "0000000000"
  	end
    return clean_number
  end

  def print_numbers
    @file.each do |line|
      number = clean_number(line[:homephone])
      puts number
    end
  end

  def clean_zipcode(original_zipcode)
    
    if original_zipcode.length < 5 
      #add zeros to the front
      original_zipcode = sprintf ("%05d"), (original_zipcode)
    else
        # its fine do nothing
    end
    #return the result
    return original_zipcode
  end

  def print_zipcode
    @file.each do |line|
      zipcode = clean_zipcode(line[:zipcode])
      puts zipcode
    end
  end

end


# Script
manager = EventManager.new
manager.print_zipcode
