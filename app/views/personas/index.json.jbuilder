json.array!(@personas) do |persona|
  json.extract! persona, :id, :first_name, :second_name, :last_name, :dob, :location_id
  json.url persona_url(persona, format: :json)
end
