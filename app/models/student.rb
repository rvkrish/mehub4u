class Student < ActiveRecord::Base
    belongs_to :user
    has_many :student_courses
    has_many :courses, through: :student_courses

    has_many :project_tackings
    has_many :assignment_trackings
end
