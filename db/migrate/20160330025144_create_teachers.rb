class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :experience
      t.string :field
      t.text :address
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
