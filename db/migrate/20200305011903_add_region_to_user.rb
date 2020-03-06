class AddRegionToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :region, :integer, null:false
  end
end
