class Batch < ApplicationRecord
  belongs_to :school
  has_many :student_batches
end
