class AddFieldsToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :status, :integer, default: 0
    add_column :carts, :stripe_session_id, :string
  end
end
