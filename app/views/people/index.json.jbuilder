json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :second_name, :last_name, :dob, :location_id
  json.url person_url(person, format: :json)
end
