json.array! @purchases do |purchase|
  json.partial! 'api/purchases/purchase', purchase: purchase

  json.program do
    json.partial! 'api/programs/program', program: purchase.program
  end
end
