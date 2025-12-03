class User < ApplicationRecord
  belongs_to :role
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true  
  validates :password, presence: true, length: { minimum: 6 }
  validates :role, presence: true
end
