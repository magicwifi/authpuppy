Jbuilder.encode do |json|
  json.connections @connections do |connection|
    json.mac connection.mac
    json.expired_on connection.expired_on
  end
end
