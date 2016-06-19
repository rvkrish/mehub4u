json.array!(@students) do |student|
  json.extract! student, :id, :name, :college, :branch, :year, :address, :user_id
  json.url student_url(student, format: :json)
end
