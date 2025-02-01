class CreateImports < ActiveRecord::Migration[6.1]
  def change
    unless table_exists?(:imports)
      create_table :imports do |t|
        t.string :import_name, null: false, unique: true
        t.binary :file_content, null: false
        t.string :content_type

        t.timestamps
      end
    end
  end
end
