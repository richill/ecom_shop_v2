class AddImagevariantToVariants < ActiveRecord::Migration[7.0]
  def change
    add_column :variants, :image_var, :string
  end
end
