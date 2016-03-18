json.array!(@posts) do |post|
  json.extract! post, :id, :text, :user_id_integer
  json.url post_url(post, format: :json)
end
