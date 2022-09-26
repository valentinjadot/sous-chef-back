
json.array! @orders do |order|
  json.id order.id
  json.userName order.user.name.capitalize
  json.meal order.meal
  json.isFIn order.user.fin
  json.isActive order.active
  json.isTakeAway order.take_away
  json.isVegan order.vegan
  json.executionDate order.execution_date
end
