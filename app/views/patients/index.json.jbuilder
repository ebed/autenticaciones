json.array!(@patients) do |patient|
  json.extract! patient, :id, :person_id
  json.url patient_url(patient, format: :json)
end
