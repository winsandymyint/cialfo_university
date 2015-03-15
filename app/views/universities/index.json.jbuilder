json.array!(@universities) do |university|
  json.extract! university, :id, :name, :tuition_fees
  json.url university_url(university, format: :json)
end
