class CreateStudentBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :student_batches do |t|

      t.timestamps
    end
  end
end
