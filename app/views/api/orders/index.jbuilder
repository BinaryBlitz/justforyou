json.array! @orders do |order|
  json.partial! 'api/orders/order', order: order

  json.programs order.programs do |program|
    json.partial! 'api/programs/program_preview', program: program
  end
end
