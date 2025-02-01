class AddDeletedAtToAllTables < ActiveRecord::Migration[6.1]
  def change
    tables = ActiveRecord::Base.connection.tables - ["schema_migrations", "ar_internal_metadata"]

    tables.each do |table|
      add_column table.to_sym, :deleted_at, :datetime
      add_index table.to_sym, :deleted_at
    end
  end
end