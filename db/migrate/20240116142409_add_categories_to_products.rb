class AddCategoriesToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :category_productitemtype_id, :integer
    add_column :products, :category_productstyle_id, :integer
    add_column :products, :category_productsubtype_id, :integer
    add_column :products, :category_producttype_id, :integer
  end
end
