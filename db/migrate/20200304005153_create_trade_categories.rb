class CreateTradeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :trade_categories do |t|
      t.references :user
      t.references :service

      t.timestamps
    end
  end
end
