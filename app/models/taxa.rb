class Taxa < ApplicationRecord
    acts_as_paranoid
    
    belongs_to :document
end
