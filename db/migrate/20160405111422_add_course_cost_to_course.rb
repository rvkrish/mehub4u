class AddCourseCostToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :course_cost, :float
  end
end
