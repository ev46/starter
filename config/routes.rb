Activemenu::Application.routes.draw do

  devise_for :admins, :controllers => {:sessions => "admins/sessions"}
  get "home/index"
  root to: "home#index"
  post "home" => 'home#follow'
  get "confirm" => 'home#confirm'
  get "clients" => 'clients#index'
end
