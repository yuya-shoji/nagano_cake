Rails.application.routes.draw do
  devise_for :admin
  namespace :admin do
    root 'homes#top', as: :root
    resources :items, expect:[:destroy]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    post 'items' => 'items#create'
  end
  root to: 'homes#top'
  devise_for :customers
  get '/customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw_customers'
  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_customers'
  get '/orders/complete' => 'orders#complete',as: 'complete_orders'
   resources :items, only:[:index, :show]
   resources :cart_items, only:[:index, :update, :destroy, :create]
   delete '/cart_items' => 'cart_items#destroy_all'
   resources :customers, only:[:create, :edit, :show, :update, :destroy]
   resources :orders, only:[:new, :index, :create, :show] do
    collection do
        post :confirm
    end
   end
   resources :addresses, expect:[:show, :new]
   get 'about' => 'homes#about'
   end