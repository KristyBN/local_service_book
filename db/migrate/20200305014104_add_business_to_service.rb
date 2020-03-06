class AddBusinessToService < ActiveRecord::Migration[6.0]
  def change
    add_reference :services, :business, null: false, foreign_key: true
  end
end
