json.array!(@levels) do |level|
  json.extract! level, :id, :name, :number_of_clicks, :image_name
  json.url level_url(level, format: :json)
end
