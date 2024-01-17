class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.integer :product_id
      t.string :colour
      t.string :image_url

      t.timestamps
    end
  end
end
