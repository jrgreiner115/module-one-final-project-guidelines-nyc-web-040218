class UserController

  def self.get_user_info
    # if self.wins = nil || self.losses = nil
    puts "What is your name?".colorize(:white)
    name =  gets.chomp
    puts "What is your weight? (sry)".colorize(:white)
    weight = gets.chomp
    puts "Have you ever fought before? (answer: Y/N)".colorize(:white)
    if gets.chomp.downcase == "Y"
      fought_before = true
    else
      fought_before = false
end
    new_fighter = {name: name, weight: weight, wins: nil, losses: nil, have_fought_before?: fought_before}

    fighter = User.create(new_fighter)
    fighter.save
  end



end
