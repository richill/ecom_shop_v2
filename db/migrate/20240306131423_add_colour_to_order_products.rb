class AddColourToOrderProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :order_products, :colour, :string
  end
end
