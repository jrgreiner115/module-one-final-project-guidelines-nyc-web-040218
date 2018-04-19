class Fighter < ActiveRecord::Base
 has_many :fights


 def self.pick_random_fighter
   random_fighter = Fighter.all.sample
   puts "Randomly, you're up against #{random_fighter.full_name_creator}. He/She has #{random_fighter.wins} wins, and #{random_fighter.losses} losses. His/Her game rating is #{random_fighter.rating}."
   Fight.create(fighter_id: random_fighter.id, user_id: User.last.id)
   Fight.fight_set_up
 end


 def self.all_add
  Fighter.all.map {|record|

    record.rating = 0

    record.rating += (record.wins / (record.losses + 1))

      if record.weight_class == "Flyweight" || record.weight_class == "Women_Featherweight"
        record.rating += 12
      elsif record.weight_class == "Bantamweight" || record.weight_class == "Women_Bantamweight"
        record.rating += 12
      elsif record.weight_class == "Featherweight" || record.weight_class == "Women_Featherweight"
        record.rating += 13
      elsif record.weight_class == "Light_Heavyweight" || record.weight_class == "Women_Light_Heavyweight"
        record.rating += 14
      elsif record.weight_class == "Welterweight" || record.weight_class == "Women_Welterweight"
        record.rating += 14
      elsif record.weight_class == "Middleweight" || record.weight_class == "Women_Middleweight"
        record.rating += 15
      else record.weight_class == "Heavyweight" || record.weight_class == "Women_Heavyweight"
        record.rating += 17
      end

      if record.title_holder == true
        record.rating += 15
      else
        record.rating += 0
      end


      var = rand(1..20)

    record.rating += var

    record.save
  }


end

 def full_name_creator
   "#{self.first_name} #{self.last_name}"
 end


 def self.search_by_name(full_name)
   fighter = self.all.find {|record| record.full_name_creator.downcase == full_name.downcase}
    if fighter != nil
     puts "You've found #{fighter.full_name_creator}. He/She has #{fighter.wins} wins, and #{fighter.losses} losses. His/Her game rating is #{fighter.rating}."

     Fight.create(fighter_id: fighter.id, user_id: User.last.id)
     puts "You've found #{fighter.full_name_creator}. He/She has #{fighter.wins} wins, and #{fighter.losses} losses. His/Her game rating is #{fighter.rating}."
     Fight.fight_set_up
   else
      puts "Oops! We can't find that name. Make sure you spelled it correctly? Try again, or type 'back' to return to the main_menu"
      Run.get_fighter_name
   end
 end

  def self.best_100_fighters
    binding.pry
    Fighter.order(rating: :desc).first(50).each_with_index do |record, index|
      puts "Here's the best 50 fighters.
      #{index += 1}. #{record.full_name_creator} rating: #{record.rating}"
    end
    "Choose a fighter from the list above for your fight, or enter 'back' to return to the browse menu."

  end

  def self.worst_100_fighters
    binding.pry
    i = 0
    Fighter.order(:rating).first(50).each_index do |record, index|
      puts "Here's the worst 50 fighters.
      #{index += 1}. #{record.full_name_creator} rating: #{record.rating}"
    end
    "Choose a fighter from the list above for your fight, or enter 'back' to return to the browse menu."
  end










end
