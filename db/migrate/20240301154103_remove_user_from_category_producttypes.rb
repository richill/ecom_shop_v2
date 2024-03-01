class RemoveUserFromCategoryProducttypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :category_producttypes, :user_id, :integer
  end
end
