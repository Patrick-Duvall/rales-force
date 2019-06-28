Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
   namespace :v1 do

     namespace :transactions do
       get '/find', to: 'search#show'
        get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
     end
     resources :transactions, only: [:index, :show]

     namespace :merchants do
       get '/most_revenue', to: 'most_revenue#index'
       get '/most_items', to: 'most_items#index'
       get '/find', to: 'search#show'
       get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
       get '/:id/revenue', to: "revenue#show"
       get '/:id/favorite_customer', to: 'favorite_customer#show'
     end
     resources :merchants, only: [:index, :show]
     namespace :invoices do
       get '/find', to: 'search#show'
       get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
     end
     resources :invoices, only: [:index, :show]

     namespace :items do
       get '/find', to: 'search#show'
       get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
       get '/most_revenue', to: 'most_revenue#index'
       get '/most_items', to: 'most_items#index'
     end
     resources :items, only: [:index, :show]

     namespace :customers do
       get '/:id/favorite_merchant', to: 'favorite_merchant#show'
       get '/find', to: 'search#show'
       get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
     end
     resources :customers, only: [:index, :show]

     namespace :invoice_items do
       get '/find', to: 'search#show'
       get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
     end
     resources :invoice_items, only: [:index, :show]

   end
 end
end
