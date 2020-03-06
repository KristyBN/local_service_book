class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :service_offered, null:false
      t.integer :category, null:false
      t.text :description, null:false
      t.decimal :hourly_rate, precision: 10, scale: 2, null:false
      t.text :calendly_url, null:false

      t.timestamps
    end
  end
end
