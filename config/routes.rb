Rails.application.routes.draw do
  resources :users
  resources :sessions 
  resources :rooms
  resources :bookings
  resources :home  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root 'users#new'
get 'payment', to: 'bookings#payment'


#destroy '/session', to: 'sessions#destroy', as: 'logout'
#show '/sessions', to: 'sessions#patch', as: 'welcome'

#delete 'delete', to: 'rooms#destroy', as: 'delete'
#resources :rooms do
 # resources :bookings
#end

  # Defines the root path route ("/")
  # root "articles#index"
end
