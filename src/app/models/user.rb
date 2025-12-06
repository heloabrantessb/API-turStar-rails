class User < ApplicationRecord
  has_secure_password

  belongs_to :role
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true  
  validates :role, presence: true

  def admin?
    self.role&.title == 'Admin'
  end

  def customer?
    self.role&.title == 'Customer'
  end

  def manager?
    self.role&.title == 'Manager'
  end
end
