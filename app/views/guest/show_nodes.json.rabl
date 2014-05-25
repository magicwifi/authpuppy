object false

child @results,:object_root => false do
  attributes :id, :mac, :name,  :last_seen
end


child @status => :status do
  attributes :code, :message
end


