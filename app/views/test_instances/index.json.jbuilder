json.array!(@test_instances) do |test_instance|
  json.extract! test_instance, :id, :test_id, :fecha, :ficha_id
  json.url test_instance_url(test_instance, format: :json)
end
