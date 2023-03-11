json.extract! order, :id, :discount_code

json.promotional_codes order.promotional_codes, :code

json.itens order.itens do |item|
  json.pizza item.pizza.name
  json.add item.add, :name
  json.remove item.remove, :name
end
