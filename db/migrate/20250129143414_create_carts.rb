class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    unless table_exists?(:carts)
      create_table :carts do |t|
        t.integer :user_id
        t.decimal :total, precision: 10, scale: 2
        t.timestamps
      end
    end
  end
end
