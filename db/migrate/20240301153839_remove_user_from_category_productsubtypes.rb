class RemoveUserFromCategoryProductsubtypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :category_productsubtypes, :user_id, :integer
  end
end
