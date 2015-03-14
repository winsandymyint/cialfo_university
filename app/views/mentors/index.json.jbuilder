json.array!(@mentors) do |mentor|
  json.extract! mentor, :id, :name, :age, :dob, :bio, :image
  json.url mentor_url(mentor, format: :json)
end
