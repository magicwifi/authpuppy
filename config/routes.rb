Authpuppy::Application.routes.draw do
  root to: "admins#login"
  post "create_login_session" => "admins#create_login_session"
  delete "logout" => "admins#logout", :as => "logout"

  resources :access_nodes
  get "access_nodes/editconfig/:id" => "access_nodes#editconfig"
  post "access_nodes/setconfig" => "access_nodes#setconfig"
  get "access_nodes/showconfig/:mac" => "access_nodes#showconfig"

  get "ping" => "wifidog#ping"
  get "auth" => "wifidog#auth"
  get "login" => "user#login"
  get "post/:aunnum" => "wifidog#authupdate"
  get "portal" => "user#portal"
  post "authenticate" =>"user#authenticate"
  get "logout" =>"user#logout"


end
