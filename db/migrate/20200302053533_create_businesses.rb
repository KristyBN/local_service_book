class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :business_name, null:false
      t.integer :service_region, null:false

      t.timestamps
    end
  end
end
