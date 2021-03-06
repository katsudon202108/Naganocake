Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
  }
  resource :customers, only: [:edit, :update]
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  root to: "homes#top"
  get '/about' => 'homes#about', as: 'about'
  get '/customers/my_page' => 'customers#show'
  get '/customers/caution' => 'customers#caution'
  put '/customers/hide' => 'customers#hide',as: "customers_hide"
  resources :items, only: [:index, :show]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :update, :destroy, :create]
  post '/orders/confirm' => 'orders#confirm'
  get '/orders/thanks' => 'orders#thanks'
  resources :orders, only: [:new, :create, :show, :index]
  resources :addresses, except: [:new, :show]

  namespace :admin do
    resources :items, except: :destroy
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    patch '/order_items/:id' => 'order_items#update', as: 'make_status'
  end
end
