class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :weight
      t.integer :wins
      t.integer :losses
      t.boolean :have_fought_before?
    end
  end
end
