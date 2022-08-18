class Restaurant < ApplicationRecord
    #associations
    has_many :orders
    has_many :customers, :through=> :orders 
    #validations
    validates :restaurant_name, presence: true,uniqueness: true
    validates :address, presence: true
    validates :restaurant_type, presence: true
end
