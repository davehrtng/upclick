json.array!(@gamers) do |gamer|
  json.extract! gamer, :id, :gamer_tag, :level_id
  json.url gamer_url(gamer, format: :json)
end
