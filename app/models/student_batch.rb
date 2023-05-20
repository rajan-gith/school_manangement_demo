class StudentBatch < ApplicationRecord
  belongs_to :student, foreign_key: :student_id, class_name: "User"
  belongs_to :batch
  enum status: {pending: 0, approved: 1, rejected: 2}
end
