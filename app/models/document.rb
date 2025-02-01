class Document < ApplicationRecord
    acts_as_paranoid
    
    validates :document_name, presence: true

    has_many :operation_products
    has_many :taxas
end
  