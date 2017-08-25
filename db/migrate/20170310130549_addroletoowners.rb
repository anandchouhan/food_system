class Addroletoowners < ActiveRecord::Migration[5.0]
  def change
  	add_column :owners, :role, :string		
  end
end
