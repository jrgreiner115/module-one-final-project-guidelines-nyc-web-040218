class UpdateFightersTable < ActiveRecord::Migration[4.2]
  def change
    add_column :fighters, :rating, :integer\
  end
end
