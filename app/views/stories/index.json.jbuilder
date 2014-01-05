json.array!(@stories) do |story|
  json.extract! story, :id, :title, :audience, :want, :because, :estimate, :value
  json.url story_url(story, format: :json)
end
