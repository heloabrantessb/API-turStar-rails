class Package < ApplicationRecord
    belongs_to :reservation, optional: true
    has_many :package_destinations, dependent: :destroy
    has_many :destinations, through: :package_destinations

    accepts_nested_attributes_for :package_destinations, allow_destroy: true

    validates :title, presence: true
    validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
