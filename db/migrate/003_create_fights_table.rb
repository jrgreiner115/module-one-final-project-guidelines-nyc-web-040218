class CreateFightsTable < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :fighter_id
      t.integer :user_id
      t.integer :fighter_rating
      t.integer :user_rating
    end
  end
end
