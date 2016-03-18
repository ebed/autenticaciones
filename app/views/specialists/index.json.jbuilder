json.array!(@specialists) do |specialist|
  json.extract! specialist, :id, :person_id
  json.url specialist_url(specialist, format: :json)
end
