class Import < ApplicationRecord
    validates :import_name, presence: true, uniqueness: true
    validates :file_content, presence: true
end  