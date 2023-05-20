class AddingSchoolReferenceToSchoolAdmin < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :school, on_delete: :nullify
  end
end
