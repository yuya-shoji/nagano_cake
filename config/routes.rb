Rails.application.routes.draw do
  namespace :admin do
    resources :items
    post 'items' => 'items#create'
  end
  root to: 'homes#top'
  devise_for :customers
  get 'items/new'
end
