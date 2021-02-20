Rails.application.routes.draw do

  
 # devise_for :users

  devise_for :users, controllers: {
    registrations: 'registrations',
    confirmations: 'confirmations'
   }

   resources :users
   resources :job_applications

  root 'static_pages#home'

  get '/home' => 'static_pages#home'
  get '/jobs' => 'job_applications#index'

  get '/users/:id', to: 'users#show'

  get '/contacts/new' => 'contacts#new'
  get '/contacts' => 'contacts#create'

end
