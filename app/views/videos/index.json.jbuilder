json.array!(@videos) do |video|
  json.extract! video, :id, :url, :type
  json.url video_url(video, format: :json)
end
