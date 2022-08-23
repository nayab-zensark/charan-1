class Product < ApplicationRecord
    has_many :product_tags
    has_many :tags, :through => :product_tags

    validates :product_name, :product_description, :price, :brand, presence: true

end
