json.array! @deliveries do |delivery|
  json.partial! 'api/deliveries/delivery', delivery: delivery

  json.address do
    json.partial! 'api/addresses/address', address: delivery.address
  end

  json.purchase do
    json.partial! 'api/purchases/purchase', purchase: delivery.purchase

    json.program do
      json.partial! 'api/programs/program_preview', program: delivery.purchase.program
    end
  end
end
