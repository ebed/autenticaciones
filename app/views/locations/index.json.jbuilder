json.array!(@locations) do |location|
  json.extract! location, :id, :address, :city, :country
  json.url location_url(location, format: :json)
end
