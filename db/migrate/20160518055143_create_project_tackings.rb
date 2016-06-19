class CreateProjectTackings < ActiveRecord::Migration
  def change
    create_table :project_tackings do |t|
      t.integer :project_id
      t.integer :student_id
      t.string :git_url
      t.string :key
      t.string :value
      t.text :completed
      t.text :remaining

      t.timestamps null: false
    end
  end
end
