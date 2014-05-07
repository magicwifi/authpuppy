object false

child @connections,:object_root => false do
  attributes :id, :mac, :expired_on, :created_at, :phonenum
end


child @status => :status do
  attributes :code, :message
end


