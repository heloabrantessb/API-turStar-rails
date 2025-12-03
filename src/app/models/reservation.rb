class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :package

  validates :reservation_date, presence: true
  validates :status, presence: true, inclusion: { in: ['pending', 'confirmed', 'canceled'] }
end
