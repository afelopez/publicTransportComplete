json.array! @vehicles do |vehicle|
  json.(vehicle, :category, :plate, :color, :year)
end