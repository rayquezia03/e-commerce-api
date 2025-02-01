class AddSectionToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :section, :string
  end
end