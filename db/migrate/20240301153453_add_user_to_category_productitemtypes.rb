class AddUserToCategoryProductitemtypes < ActiveRecord::Migration[7.0]
  def change
    add_column :category_productitemtypes, :admin_id, :integer
  end
end
