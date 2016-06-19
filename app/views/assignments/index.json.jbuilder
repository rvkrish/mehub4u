json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :topic
  json.url assignment_url(assignment, format: :json)
end
