json.array!(@colleges) do |college|
  json.extract! college, :id, :name, :country, :sat_min_score, :sat_max_score, :tuition_fees
  json.url college_url(college, format: :json)
end
