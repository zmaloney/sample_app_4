SampleApp4::Application.routes.draw do
  #special one here, to route root directly to the home method of the StaticPagesController.
  root to: 'static_pages#home'
  
  #takes a page "alias" (ex: "/about_path", as used in static_pages_spec.rb) 
  # and routes it to an action (#about) of a controller (static_pages)
  # I can use the via: option to match multiple verbs, or just use the verb itself 
  # instead of 'match'
  match '/about_path', to: 'static_pages#about', via: [:get, :post]
  match '/contact_path', to: 'static_pages#contact', via: [:get, :post]
  match '/help_path', to: 'static_pages#help', via: [:get, :post]
  match '/home_path', to: 'static_pages#home', via: [:get, :post]
  
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
