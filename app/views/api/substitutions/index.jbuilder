json.array! @substitutions do |substitution|
  json.partial! 'api/substitutions/substitution', substitution: substitution

  json.product do
    json.partial! 'api/products/product', product: substitution.product
  end
end
