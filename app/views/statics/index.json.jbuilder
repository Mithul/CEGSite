json.array!(@statics) do |static|
  json.extract! static, :id, :name, :content
  json.url static_url(static, format: :json)
end
