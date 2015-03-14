json.array!(@students) do |student|
  json.extract! student, :id, :name, :age, :dob, :current_school, :current_level, :country, :sat_score
  json.url student_url(student, format: :json)
end
