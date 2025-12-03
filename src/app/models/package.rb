class Package < ApplicationRecord
    belongs_to :reservation

    validates :title, presence: true
    validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
