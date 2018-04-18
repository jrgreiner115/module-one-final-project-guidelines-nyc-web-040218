class UsersController

  def self.get_user_info
    # if self.wins = nil || self.losses = nil
    puts "What is your name?"
    name= gets.chomp
    puts "What is your weight? (sry)"
    weight = gets.chomp
    puts "Have you ever fought before? (answer: Y/N)"
    if gets.chomp == "Y"
      fought_before = true
    else
      fought_before = false
end
    new_fighter = {name: name, weight: weight, wins: nil, losses: nil, have_fought_before?: fought_before}

    fighter = User.create(new_fighter)
    fighter.save
  end

  

end
