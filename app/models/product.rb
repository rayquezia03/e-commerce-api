class Product < ApplicationRecord
    has_one_attached :image
    include Rails.application.routes.url_helpers

    validates :name, :price, presence: true
    validates :stock_quantity, numericality: { greater_than_or_equal_to: 0, message: "negative stock" }
    validates :price, presence: true
    validates :section, presence: true 

    def image_url
        rails_blob_url(image, only_path: false)
    end
end