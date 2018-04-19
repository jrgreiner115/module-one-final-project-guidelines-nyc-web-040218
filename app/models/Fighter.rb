class Fighter < ActiveRecord::Base
 has_many :fights

 old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil


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
     Fight.create(fighter_id: fighter.id, user_id: User.last.id)
     puts "This is #{fighter.full_name_creator}. He/She has #{fighter.wins} wins, and #{fighter.losses} losses. His/Her game rating is #{fighter.rating}."
     Fight.fight_set_up
   else
      puts "Oops! We can't find that name. Make sure you spelled it correctly? Try again, or type 'back' to return to the main_menu"
      get_fighter_name
   end
 end

 def self.best_50_fighters
    puts "Here are the 50 best fighters."
      Fighter.order(rating: :desc).first(50).each_with_index do |record, index|
        puts "#{index += 1}. #{record.full_name_creator} rating: #{record.rating}"
      end
    puts "Choose a fighter from the list above for your fight by entering their name."
      input = gets.chomp
      Fighter.search_by_name(input)
  end

  def self.worst_50_fighters
    puts "Here are the 50 worst fighters."
      Fighter.order(:rating).first(50).each_with_index do |record, index|
        puts "#{index += 1}. #{record.full_name_creator} rating: #{record.rating}"
      end
    puts "Choose a fighter from the list above for your fight by entering their name."
      input = gets.chomp
      Fighter.search_by_name(input)
end

  def self.most_wins
    puts "Here are the 50 fighters with the most wins."
      Fighter.order(wins: :desc).first(50).each_with_index do |record, index|
        puts "#{index += 1}. #{record.full_name_creator} wins: #{record.wins}"
      end
    puts "Choose a fighter from the list above for your fight by entering their name."
      input = gets.chomp
      Fighter.search_by_name(input)
  end

  def self.most_losses
    puts "Here are the 50 fighters with the most losses."
      Fighter.order(losses: :desc).first(50).each_with_index do |record, index|
        puts "#{index += 1}. #{record.full_name_creator} losses: #{record.losses}"
      end
    puts "Choose a fighter from the list above for your fight by entering their name."
      input = gets.chomp
      Fighter.search_by_name(input)
  end

  def self.title_holder_with_the_least_wins
    fighter = Fighter.where(title_holder: true).order(:wins).first
    Fight.create(fighter_id: fighter.id, user_id: User.last.id)
    puts "You've discovered #{fighter.full_name_creator}. He/She has #{fighter.wins} wins, and #{fighter.losses} losses, and is a titleholder. His/Her game rating is #{fighter.rating}."
    Fight.fight_set_up
  end

  def self.fighter_with_the_longest_name
     fighter = nil
     counter = 0
     Fighter.all.map {|record|
     a = "#{record.first_name}#{record.last_name}"
     a = a.length
     if a > counter
       counter = a
       fighter = "#{record.first_name} #{record.last_name}"
     end
     }
   fighter
  end

  def self.find_welterweight_with_the_most_losses_not_fighting
    fighter = Fighter.where(weight_class: "Welterweight", fighter_status: "NotFighting").order(losses: :desc).first
    Fight.create(fighter_id: fighter.id, user_id: User.last.id)
    puts "You've discovered #{fighter.full_name_creator}. #{fighter.first_name} is a #{fighter.weight_class}. He/She has #{fighter.wins} wins, and #{fighter.losses} losses. His/Her game rating is #{fighter.rating}."
    Fight.fight_set_up
  end

  def rating_update
  self.rating = 0

    self.rating += (self.wins / (self.losses + 1))

    if self.weight_class == "Flyweight" || self.weight_class == "Women_Featherweight"
      self.rating += 12
    elsif self.weight_class == "Bantamweight" || self.weight_class == "Women_Bantamweight"
      self.rating += 12
    elsif self.weight_class == "Featherweight" || self.weight_class == "Women_Featherweight"
      self.rating += 13
    elsif self.weight_class == "Light_Heavyweight" || self.weight_class == "Women_Light_Heavyweight"
      self.rating += 14
    elsif self.weight_class == "Welterweight" || self.weight_class == "Women_Welterweight"
      self.rating += 14
    elsif self.weight_class == "Middleweight" || self.weight_class == "Women_Middleweight"
      self.rating += 15
    else self.weight_class == "Heavyweight" || self.weight_class == "Women_Heavyweight"
      self.rating += 17
    end

    if self.title_holder == true
      self.rating += 15
    else
      self.rating += 0
    end
    var = rand(1..20)

  self.rating += var

  self.save

  end
end
