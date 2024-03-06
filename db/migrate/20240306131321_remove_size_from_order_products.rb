class RemoveSizeFromOrderProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_products, :size, :string
  end
end
