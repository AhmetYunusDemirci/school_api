class Teacher < ApplicationRecord
  belongs_to :department
  has_many :courses
  has_secure_password

  validates :email, presence: true, uniqueness: true
end
