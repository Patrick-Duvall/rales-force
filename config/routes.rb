Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
   namespace :v1 do
     namespace :transactions do
       get '/find', to: 'search#show'
     end
     resources :transactions, only: [:index, :show]

     namespace :merchants do
       get '/most_revenue', to: 'most_revenue#index'
       get '/find', to: 'search#show'
       get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
       get '/:id/favorite_customer', to: 'favorite_customer#show'
     end
     resources :merchants, only: [:index, :show]
   end
 end
end
