class AddingFieldsToStudentBatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :student_batches, :student, foreign_key: {to_table: :users}, on_delete: :cascade
    add_reference :student_batches, :batch, foreign_key: true, on_delete: :cascade
    add_column :student_batches, :status, :integer, default: 0
  end
end
