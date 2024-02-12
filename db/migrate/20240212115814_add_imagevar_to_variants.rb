class AddImagevarToVariants < ActiveRecord::Migration[7.0]
  def change
    add_column :variants, :imagevariant, :string
  end
end
