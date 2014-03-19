Authpuppy::Application.routes.draw do
  root to: "admins#login"
  post "create_login_session" => "admins#create_login_session"
  delete "logout" => "admins#logout", :as => "logout"

  resources :access_nodes
  get "access_nodes/:id/advanced" => "access_nodes#advanced", :as => "advance"

  get "ping" => "wifidog#ping"
  get "gw_message.php" => "wifidog#denied"
  get "auth" => "wifidog#auth"
  get "login" => "user#login"
  get "post/:aunnum" => "wifidog#authupdate"
  get "portal" => "user#portal"
  post "authenticate" =>"user#authenticate"
  get "logout/:token" =>"user#logout", :as => "offline"
  post "bindurl" =>"user#bindurl"
  post "query_lat_long" => "access_nodes#query_lat_long"
  post "auth_update" => "auth#update"
  get "timeline" => "activity#timeline", :as => "timeline"

end
