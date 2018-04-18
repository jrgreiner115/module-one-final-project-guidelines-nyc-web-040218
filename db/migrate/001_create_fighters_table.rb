class CreateFightersTable < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.string :first_name
      t.string :last_name
      t.string :weight_class
      t.integer :wins
      t.integer :losses
      t.integer :json_id => false
      t.integer :statid
      t.integer :draws
      t.string :fighter_status
      t.boolean :title_holder
      t.text :thumbnail
      t.text :belt_thumbnail
    end
  end
end
