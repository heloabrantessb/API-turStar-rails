class Category < ApplicationRecord
    has_many :destinations

    validates :title, presence: true
end
