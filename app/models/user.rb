class User < ApplicationRecord
  has_many :events
  # has_many :comments
  has_many :comments, through: :events

  has_secure_password
  # Verify that an email exists and that it does not already exist in the db
  validates :email, presence: true, uniqueness: true
end
