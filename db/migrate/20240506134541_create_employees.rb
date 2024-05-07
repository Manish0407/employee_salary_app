class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :employee_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.date :doj
      t.integer :salary

      t.timestamps
    end
  end
end
