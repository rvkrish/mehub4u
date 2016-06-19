class Course < ActiveRecord::Base
     has_many :student_courses
     has_many :students , through: :student_courses
     has_and_belongs_to_many :videos
end
