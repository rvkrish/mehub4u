class CreateStudentCourses < ActiveRecord::Migration
  def change
    create_table :student_courses do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :teacher_id
      t.string :state

      t.timestamps null: false
    end
  end
end
