class CreateToDos < ActiveRecord::Migration[7.0]
  def change
    create_table :to_dos do |t|
      t.string :title
      t.string :description
      t.date :due_date

      t.timestamps
    end
  end
end
