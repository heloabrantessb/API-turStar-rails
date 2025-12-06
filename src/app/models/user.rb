class User < ApplicationRecord
  belongs_to :role
  has_many :reservations, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true  
  validates :password_digest, presence: true, length: { minimum: 6 }
  validates :role, presence: true

  def admin?
    self.role&.title == 'Admin'
  end

  def customer?
    self.role&.title == 'Customer'
  end
end
