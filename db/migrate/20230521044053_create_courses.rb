class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :batch, on_delete: :cascade
      t.timestamps
    end
  end
end
