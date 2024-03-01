class RemoveUserFromCategoryProductstyles < ActiveRecord::Migration[7.0]
  def change
    remove_column :category_productstyles, :user_id, :integer
  end
end
