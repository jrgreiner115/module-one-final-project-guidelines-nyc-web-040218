class Fighter < ActiveRecord::Base
 has_many :fights

 #
 # Fighter.find(id)
 #
 # def pick_random_fighter
 #   Fighter.all.sample
 # end
 #
 # def fighter_score
 # def update
 #

 def self.all_add
   self.all.map {|record|

       record.rating = 0

     record.rating += (record.wins / record.losses).to_f

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
     end

     record.rating += 3#rand(1…40)
     #
     record.rating }
 end


end





binding.pry
puts "pry me"
