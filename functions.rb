require 'readline' # is a library that allows you to interact with the user to get user input.
require 'date'

# Ask the user (via the command line) to provide valid start and end dates.
#
# @return [array] [start_date, end_date]
#
def query_user_for_date_range
  start_date = nil
  end_date = nil

  puts "\nFirst, we need a start date."
  start_date = query_user_for_date

  puts "\nNext, we need an end date."
  end_date = query_user_for_date

  return [start_date, end_date]
end

# Ask the user (via the command line) for a single valid date. 
# Used for both start and end dates.
def query_user_for_date
  date = nil
  until date.is_a? Date
    prompt = "Please enter a date as YYYY-MM-DD: "
    response = Readline.readline(prompt, true)
    
    # We have the option to quit at any time.
    exit if ['quit', 'exit', 'q', 'x'].include?(response)

    begin
      date = Date.parse(response) # "parse" takes a string and tries to turn it into a Date Object.
                                  # IF "parse" fails THEN it will return an argument error AND is
                                  # why this parse is inside this BEGIN END RESCUE block which will
                                  # RESCUE it if argument error and just output "Invalid date format."
    rescue ArgumentError
      puts "\nInvalid date format."
    end
    
  end
  return date
end
