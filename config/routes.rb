Rails.application.routes.draw do
  devise_for :users
  
  root to: 'home#index'
  
  get "create_package" => "home#create_package"
  post "create_package" => "home#build_package"
  get "create_package_ok" => "home#create_package_ok"
  get "packages/:id" => "packages#show"
  get "packages" => "packages#index"
  get "cities_to" => "home#cities_to"
  get "flights" => "home#flights"

  delete "cart_items/:id" => "carts#delete_item"
  post "cart_items" => "carts#update_item"
  get "admin" => "admin#index"
  get "confirm_cart/:id" => "home#confirm_cart"
  post "confirm" => "home#confirm"
  get "active/:token" => "home#active"
  get "contacts" => "home#contacts"
  post "contacts" => "home#contacts_create"
  get "callback" => "home#callback"
  post "callback" => "home#callback"
  
  get "carts" => "carts#index"
  
  resources :carts
  
  resources :comments
  namespace :admin do
    resources :cities
    resources :flights
    resources :packages
    resources :contacts
    resources :requests
  end
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
