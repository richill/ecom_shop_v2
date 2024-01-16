class CreateCategoryProductsubtypes < ActiveRecord::Migration[7.0]
  def change
    create_table :category_productsubtypes do |t|
      t.string :name
      t.string :code_name
      t.integer :user_id
      t.integer :category_productitemtype_id

      t.timestamps
    end
  end
end
