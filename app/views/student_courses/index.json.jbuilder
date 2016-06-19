json.array!(@student_courses) do |student_course|
  json.extract! student_course, :id, :student_id, :course_id, :teacher_id, :state
  json.url student_course_url(student_course, format: :json)
end
