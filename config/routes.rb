Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'

  get '/home' => 'static_pages#home'
 
end
