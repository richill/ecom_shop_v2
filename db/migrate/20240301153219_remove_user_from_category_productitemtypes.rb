class RemoveUserFromCategoryProductitemtypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :category_productitemtypes, :user_id, :integer
  end
end
