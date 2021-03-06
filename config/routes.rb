Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
   namespace :v1 do

     namespace :transactions do
       get '/find', to: 'search#show'
        get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
       get '/:id/invoice', to: 'invoice#show'
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
       get '/:id/items', to: 'items#index'
       get '/:id/invoices', to: 'invoices#index'
       get '/revenue', to: 'date_revenue#show'
       get '/:id/customers_with_pending_invoices', to: 'customers_with_pending_invoices#index'
     end
     resources :merchants, only: [:index, :show] do
     end
     namespace :invoices do
       get '/find', to: 'search#show'
       get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
       get '/:id/transactions', to: 'transactions#index'
       get '/:id/invoice_items', to: 'invoice_items#index'
       get '/:id/items', to: 'items#index'
       get'/:id/customer', to: 'customer#show'
       get'/:id/merchant', to: 'merchant#show'
     end
     resources :invoices, only: [:index, :show]

     namespace :items do
       get '/find', to: 'search#show'
       get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
       get '/most_revenue', to: 'most_revenue#index'
       get '/most_items', to: 'most_items#index'
       get '/:id/best_day', to: 'best_day#show'
       get '/:id/merchant', to: 'merchant#show'
       get '/:id/invoice_items', to: 'invoice_items#index'
     end
     resources :items, only: [:index, :show]

     namespace :customers do
       get '/:id/favorite_merchant', to: 'favorite_merchant#show'
       get '/find', to: 'search#show'
       get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
       get '/:id/invoices', to: 'invoices#index'
       get '/:id/transactions', to: 'transactions#index'
     end
     resources :customers, only: [:index, :show]

     namespace :invoice_items do
       get '/find', to: 'search#show'
       get '/random', to: 'search#show'
       get '/find_all', to: 'search#index'
       get '/:id/invoice', to: 'invoice#show'
       get '/:id/item', to: 'item#show'
     end
     resources :invoice_items, only: [:index, :show]

   end
 end
end
