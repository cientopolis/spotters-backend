json.extract! conf, :id, :title, :zoom, :heading_center, :pitch_center, :proximity_distance, :created_at, :updated_at
json.center do
  json.lat conf.center.y
  json.lng conf.center.x
end
json.bounds do
  json.array! conf.bounds.exterior_ring.points do |point|
    json.lat point.y
    json.lng point.x
  end
end
