class Customer < ApplicationRecord
    #associations
    has_many :orders
    has_many :restaurants, :through=> :orders

    #validations
    validates :name, presence: true
    validates :mobile_number, presence: true, numericality: true, uniqueness: true, length: { is: 6}
    validates :email, presence: true, uniqueness: true
    validates :address, presence: true

end
