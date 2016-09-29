json.extract! conf, :id, :title, :zoom, :heading_center, :pitch_center, :proximity_distance, :created_at, :updated_at
json.center do
  json.lat conf.center.y
  json.lng conf.center.x
end
