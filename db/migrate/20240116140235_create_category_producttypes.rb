class CreateCategoryProducttypes < ActiveRecord::Migration[7.0]
  def change
    create_table :category_producttypes do |t|
      t.string :name
      t.string :code_name
      t.integer :user_id

      t.timestamps
    end
  end
end
