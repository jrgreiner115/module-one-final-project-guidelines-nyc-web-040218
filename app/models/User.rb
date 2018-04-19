class User < ActiveRecord::Base
 has_many :fights


 def self.add_all

    User.all.map {|record|

   record.rating = 0




   if record.wins == 0 || record.wins == nil
       record.wins = 1
   end

   if record.losses == 0 || record.losses == nil
       record.losses = 1
   end

     record.rating += (record.wins / record.losses)

   if record.have_fought_before? == true
     record.rating += 15
   else
     record.rating
   end

   if record.weight == 0
     record.rating = 6
   elsif record.weight == nil
     record.rating = 6
   elsif record.weight <= 110
     record.rating += 7
   elsif record.weight <= 125 && record.weight > 110
     record.rating += 8
   elsif record.weight <= 140 && record.weight > 125
     record.rating += 9
   elsif record.weight <= 155 && record.weight > 140
     record.rating += 10
   elsif record.weight <= 170 && record.weight > 155
     record.rating += 12
   elsif record.weight <= 185 && record.weight > 170
     record.rating += 13
   elsif record.weight <= 200 && record.weight > 185
     record.rating += 14
   elsif record.weight <= 215 && record.weight > 200
     record.rating += 15
   else record.weight > 215
     record.rating += 16
   end


      var = rand(10..25)
      record.rating += var
      record.save
    }
 end

def self.find_me
  id = User.last.id

  current_user = User.find(id)
  puts "You are #{current_user.name}. Your weight is #{current_user.weight}. You have #{current_user.wins - 1} wins and #{current_user.losses - 1} losses. Your rating is #{current_user.rating}."
  sleep 1.0
  puts "Options:
  To change any of your attributes or delete your profile, type 'preferences'. To go back to the menu, type 'back'."

  input = gets.chomp

  if input.downcase == "preferences"
    preferences
  elsif input.downcase == "back"
    main_menu
  else
    puts "Whoops, didn't quite get that. We'll take you back to the Menu."
    main_menu
  end
end




 def user_rating_update

   self.rating = 0




   if self.wins == 0 || self.wins == nil
       self.wins = 1
   end

   if self.losses == 0 || self.losses == nil
       self.losses = 1
   end

     self.rating += (self.wins / self.losses)

   if self.have_fought_before? == true
     self.rating += 15
   else
     self.rating
   end

   if self.weight == 0
     self.rating = 6
   elsif self.weight == nil
     self.rating = 6
   elsif self.weight <= 110
     self.rating += 7
   elsif self.weight <= 125 && self.weight > 110
     self.rating += 8
   elsif self.weight <= 140 && self.weight > 125
     self.rating += 9
   elsif self.weight <= 155 && self.weight > 140
     self.rating += 10
   elsif self.weight <= 170 && self.weight > 155
     self.rating += 12
   elsif self.weight <= 185 && self.weight > 170
     self.rating += 13
   elsif self.weight <= 200 && self.weight > 185
     self.rating += 14
   elsif self.weight <= 215 && self.weight > 200
     self.rating += 15
   else self.weight > 215
     self.rating += 16
   end


      var = rand(10..25)
      self.rating += var
      self.save

 end



end
