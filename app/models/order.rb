class Order < ApplicationRecord
  #associations
  belongs_to :restaurant
  belongs_to :customer


  #validations
  validates :item_name, :price, :quantity, :delivery_address, presence: true
end
