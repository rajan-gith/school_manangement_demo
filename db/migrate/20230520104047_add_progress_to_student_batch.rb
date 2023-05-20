class AddProgressToStudentBatch < ActiveRecord::Migration[7.0]
  def change
    add_column :student_batches, :progress, :float
  end
end
