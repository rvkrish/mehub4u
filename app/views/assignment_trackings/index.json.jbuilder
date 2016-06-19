json.array!(@assignment_trackings) do |assignment_tracking|
  json.extract! assignment_tracking, :id, :assignment_id, :user_id, :topic, :solution, :git_url
  json.url assignment_tracking_url(assignment_tracking, format: :json)
end
