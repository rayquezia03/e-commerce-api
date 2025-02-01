class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.decimal :total, precision: 10, scale: 2
      t.string :status, default: "done"

      t.timestamps
    end
  end
end
