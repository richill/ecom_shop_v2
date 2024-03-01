class AddAdminToCategoryProductstyles < ActiveRecord::Migration[7.0]
  def change
    add_column :category_productstyles, :admin_id, :integer
  end
end
