json.array! @days do |day|
  json.partial! 'api/days/day', day: day

  json.products day.products do |product|
    json.partial! 'api/products/product', product: product
  end
end
