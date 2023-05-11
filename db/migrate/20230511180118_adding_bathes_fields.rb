class AddingBathesFields < ActiveRecord::Migration[7.0]
  def change
    add_column :batches, :name, :string
    add_reference :batches, :school, foreign_key: true, on_delete: :cascade
  end
end
