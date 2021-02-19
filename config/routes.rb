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
  get '/orders/complete' => 'orders#complete'
  post '/orders/confirm'=> 'orders#confirm'
   resources :items, only:[:index, :show]
   resources :cart_items, only:[:index, :update, :destroy, :create]
   resources :customers, only:[:index, :create, :edit, :show, :update, :destroy]
   resources :orders, only:[:new, :index]
   resources :addresses, expect:[:show, :new]
   get 'about' => 'homes#about'
   end