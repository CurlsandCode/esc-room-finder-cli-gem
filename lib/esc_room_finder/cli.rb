class EscRoomFinder::CLI

  attr_accessor :zipcode

  def initialize(zipcode = nil)
    @zipcode = zipcode
    call
  end

  def call(zipcode = nil)
    puts "Welcome to Escape Room Finder!"
    puts "Please enter your zip code. We will list your local Escape Rooms!"

    zipcode = gets.strip.to_i
    

    @escaperooms= EscRoomFinder::Api.find_by_zipcode(zipcode)
    list_rooms(zipcode)
  end



  def list_rooms(zipcode)
    @zipcode = zipcode
    puts "************* Good news! The Following Establishments in #{@zipcode} are Escape Rooms! *************"

    puts ""
    @escaperooms.each_with_index do |room, index| puts "#{index+1}. #{room.businessName}"
    end
    more_information
  end

  def more_information
    puts ""
    puts "Want more information? Enter the index number of the room you wish to see."
    index = gets.strip.to_i-1
    puts ""

    if escaperoom = EscRoomFinder::EscRoom.find(index)
      puts "Name: #{escaperoom.businessName}"
      puts "Address: #{escaperoom.street}"
      puts "City: #{escaperoom.city}"
      puts "State: #{escaperoom.state}"
      puts "Zipcode: #{escaperoom.zip}"
      puts "Phone: #{escaperoom.phone}"
      puts "Website: #{escaperoom.websiteURL}"
    else
      puts "That's an invalid entry!"
    end

    puts ""
    puts "Type 'back' to return to the list of rooms. Enter any key to end this program." 

    input = gets.strip.downcase

    if input == "back"
      list_rooms(zipcode)
    end

  end
end