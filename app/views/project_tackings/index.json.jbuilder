json.array!(@project_tackings) do |project_tacking|
  json.extract! project_tacking, :id, :project_id, :student_id, :git_url, :key, :value, :completed, :remaining
  json.url project_tacking_url(project_tacking, format: :json)
end
