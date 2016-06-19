class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :college
      t.string :branch
      t.integer :year
      t.text :address
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
