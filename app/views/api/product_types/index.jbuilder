json.array! @product_types do |product_type|
  json.partial! 'api/product_types/product_type', product_type: product_type

  json.products product_type.products do |product|
    json.partial! 'api/products/product', product: product
  end
end
