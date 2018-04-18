require 'pry'
require_relative '../config/environment'

def main_menu
  if gets.chomp == 1
    self.find_interesting_things
  elsif gets.chomp == 2
    Fighter.search_by_name
  elsif gets.chomp == 3
    Fighter.random_fighter
  else puts "Oops! You put in an incorrect input. Try again, or quit by typing 'exit!'"
  end
end



# require_relative "./seeds.rb"
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
UsersController.get_user_info
puts "Thanks! Here We Go."
puts "Main Menu:


Type the number for an option.

1. Find Interesting Things About Fighters \n
2. Search For Fighter By Name \n
3. Fight Random Fighter"

main_menu





















false
