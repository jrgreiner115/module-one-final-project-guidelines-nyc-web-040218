class Fight < ActiveRecord::Base
  belongs_to :user
  belongs_to :fighter

  def self.fight_set_up
    Fight.last.fighter_id
    Fight.last.user_id
    Fight.fight?
  end

  def self.fight?
    puts "Do you want to fight? \n
    Type 'Y' for Yes, 'N' for No"
    input = gets.chomp
    if input == "Y"
      Fight.fight_night
    else
      "Okay, let's go back to the Main Menu"
      main_menu
    end
  end

  def self.fight_night
    ufc_fighter = Fight.last.fighter_id
    user_fighter = Fight.last.user_id
    opponent = Fighter.find(ufc_fighter)
    user = User.find(user_fighter)
    if opponent.rating > user.rating
      puts "You Lost. I suppose that isn't too surprising, considering these are professionals and you're here by accident."

      opponent.update(wins: opponent.wins += 1)
      user.update(losses: user.losses += 1)

      Fighter.all_add
      User.add_all

      main_menu
    else
      puts "You won! Wow, that was unexpected."

      user.update(wins: user.wins += 1)
      opponent.update(losses: opponent.losses += 1)
      Fighter.all_add
      opponent.rating
      User.add_all

      main_menu
    end
  end


end
