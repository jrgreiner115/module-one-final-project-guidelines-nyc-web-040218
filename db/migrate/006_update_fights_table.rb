class UpdateFightsTable < ActiveRecord::Migration[4.2]
  def change
    remove_column(:fights, :fighter_rating)
    remove_column(:fights, :user_rating)
  end
end
