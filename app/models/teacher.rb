class Teacher < ApplicationRecord
  belongs_to :department
  has_many :courses
end
