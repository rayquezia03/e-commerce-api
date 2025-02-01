class Import < ApplicationRecord
    acts_as_paranoid
    
    validates :import_name, presence: true, uniqueness: true
    validates :file_content, presence: true
end  