class CreateUserFees < ActiveRecord::Migration[5.0]
  def change
    create_table :user_fees do |t|
      t.integer :owner_id
      t.integer :user_id
      t.integer :food_fee_id
      t.timestamps
    end
  end
end
