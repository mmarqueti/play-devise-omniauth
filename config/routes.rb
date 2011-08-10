Devisefull::Application.routes.draw do

  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :projects
  resources :authentications

  get "talk/twitter"
  get "talk/facebook"
  
  root :to => "projects#index"
end
