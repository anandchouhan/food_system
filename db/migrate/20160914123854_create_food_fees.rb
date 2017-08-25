class CreateFoodFees < ActiveRecord::Migration[5.0]
  def change
    create_table :food_fees do |t|
      t.integer :owner_id
      t.string :timing
      t.float :price
      t.string :status
      t.timestamps
    end
  end
end
