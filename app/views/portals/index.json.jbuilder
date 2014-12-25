json.array!(@portals) do |portal|
  json.extract! portal, :id, :latE6, :lngE6, :address, :name
  json.url portal_url(portal, format: :json)
end
