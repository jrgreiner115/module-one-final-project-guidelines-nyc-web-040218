require 'pry'
require_relative '../config/environment'

Fighter.where(wins: nil).delete_all
Fighter.all_add

def get_fighter_name
  fighter_name = gets.chomp
  if fighter_name.downcase == "back"
    main_menu
  else
  Fighter.search_by_name(fighter_name)
  end
end


def find_interesting_things
  puts "Hellooooooooooooo Lets find interesting things!"
end

def search_by_name_menu
  puts "Type the Fighter's name in! Make sure to check spelling. Type 'back' if you'd like to go back to the Main Menu."
  get_fighter_name
end

  def preferences
      puts "PREFERENCES
      1. Update Character
      2. Delete Character
      3. Back to Main Menu"
      input = gets.chomp
      if input == "1"
        puts "Cool, just re-enter your info."
        UserController.get_user_info
        main_menu
      elsif
        input == "2"
        "Your character is goneeeeeee."
        User.last.delete
        UserController.get_user_info
        main_menu
      elsif
        input == "3"
        main_menu
      else
        puts "Oops! You put in an incorrect input. Try again, or quit by typing 'exit!'"
        preferences
      end
  end


def main_menu
  puts "Main Menu:


  Enter a number for an option. Or, type 'quit' to quit Fight Night.

  1. Find Interesting Things About Fighters
  2. Search For Fighter By Name
  3. Fight Random Fighter
  4. Preferences"

  input = gets.chomp
  if input == "1"
    find_interesting_things
  elsif input == "2"
    search_by_name_menu
  elsif input == "3"
    Fighter.pick_random_fighter
  elsif input == "4"
      preferences
  elsif input.downcase == "quit"
     exit
  else puts "Oops! You put in an incorrect input. Try again, or quit by typing 'exit!'"
    main_menu
  end
end





puts <<-EOF

.d888d8b        888     888
d88P" Y8P        888     888
888              888     888
888888888 .d88b. 88888b. 888888
888   888d88P"88b888 "88b888
888   888888  888888  888888
888   888Y88b 888888  888Y88b.
888   888 "Y88888888  888 "Y888
             888
        Y8b d88P
         "Y88P"
\n
EOF

puts "Welcome to UFC Fight Night.

You've found yourself accidentally in the locker room, and everyone thinks you're in the next fight.

Good luck.

ᕙ(° ͜ಠ ͜ʖ ͜ಠ°)ᓄ

"
binding.pry
UserController.get_user_info
User.add_all
puts "Thanks! Here We Go. \n"



main_menu
