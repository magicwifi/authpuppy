Authpuppy::Application.routes.draw do
  root to: "admins#login"
  post "create_login_session" => "admins#create_login_session"
  delete "logout" => "admins#logout", :as => "logout"

  resources :access_nodes
  get "access_nodes/:id/advanced" => "access_nodes#advanced", :as => "advance"
  post "access_nodes/setconfig" => "access_nodes#setconfig"

  get "ping" => "wifidog#ping"
  get "gw_message.php" => "wifidog#denied"
  get "auth" => "wifidog#auth"
  get "login" => "user#login"
  get "post/:aunnum" => "wifidog#authupdate"
  get "portal" => "user#portal"
  post "authenticate" =>"user#authenticate"
  get "logout/:token" =>"user#logout", :as => "offline"
  post "bindurl" =>"guest#bindurl"
  post "query_lat_long" => "access_nodes#query_lat_long"
  post "auth_update" => "auth#update"
  get "timeline" => "activity#timeline", :as => "timeline"
  post "showconnections" => "guest#show_connections"
  post "update_auth_type" => "guest#update_auth_type"
  post "update_auth_device" => "guest#update_auth_device"
  post "update_access_time" => "guest#update_access_time"
  get "indexconn" => "guest#index"

end
