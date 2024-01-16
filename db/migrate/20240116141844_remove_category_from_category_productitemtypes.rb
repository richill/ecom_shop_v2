class RemoveCategoryFromCategoryProductitemtypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :category_productitemtypes, :category_productsubtypes_id, :integer
  end
end
