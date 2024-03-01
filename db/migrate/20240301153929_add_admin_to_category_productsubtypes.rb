class AddAdminToCategoryProductsubtypes < ActiveRecord::Migration[7.0]
  def change
    add_column :category_productsubtypes, :admin_id, :integer
  end
end
