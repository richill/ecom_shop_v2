class RemoveImagevarFromVariants < ActiveRecord::Migration[7.0]
  def change
    remove_column :variants, :imagevariant, :string
  end
end
