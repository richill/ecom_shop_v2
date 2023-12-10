class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
    add_index :reviews, :rating
    add_index :reviews, :comment
    add_index :reviews, :user_id
    add_index :reviews, :product_id
  end
end
