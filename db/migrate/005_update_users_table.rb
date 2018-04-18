class UpdateUsersTable < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :rating, :integer
  end
end
