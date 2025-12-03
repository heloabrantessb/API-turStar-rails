class Destination < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :base_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :country, presence: true
end
