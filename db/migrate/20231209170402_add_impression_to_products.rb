class AddImpressionToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :impressions_count, :integer
    add_index :products, :impressions_count
  end
end
