Rails.application.routes.draw do 
  ActiveAdmin.routes(self)
  resources :ip_assets
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :dashboard
  root 'dashboard#index'
  get 'tags/:tag', to: 'ip_assets#index', as: :tag
  get '/pending', to:"users#index"
  get '/review', to: "users#index1"
  get '/accept', to: "users#index2"
  get '/reject', to: "users#index3"

  get '/approve', to: "ip_assets#approve"
  get '/approve1', to: "ip_assets#approve1"
  get '/approve2', to: "ip_assets#approve2"
  get '/approve3', to: "ip_assets#approve3"
  get '/stake', to: "ip_assets#stake"
  get '/resubmit', to: "ip_assets#resubmit"

  
end
  	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

