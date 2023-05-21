class Batch < ApplicationRecord
  belongs_to :school
  has_many :courses
  has_many :student_batches
end
