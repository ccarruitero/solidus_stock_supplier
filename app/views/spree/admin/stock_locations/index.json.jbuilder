json.set! :store do
  json.array! @locations.for_store do |location|
    json.extract! location, :id, :name
  end
end

json.set! :supplier do
  json.array! @locations.for_supplier do |location|
    json.extract! location, :id, :name
  end
end
