class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.string :address, null:false
      t.integer :region, null:false
      t.integer :phone_number, null:false
      t.string :email, null:false

      t.timestamps
    end
  end
end
