json.array! @days do |day|
  json.partial! 'api/days/day', day: day

  json.items day.items do |item|
    json.partial! 'api/items/item', item: item
  end
end
