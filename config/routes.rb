SampleApp4::Application.routes.draw do
  
  #Route for user display. Because we register :users as a resource, redirect_to automatically 
  # routes to the show page for the user object. 
  # In fact, this adds a whole set of RESTful routes provided by the Users resource : 
  # see page 280, Table 1, for a table of all the routes provided by this single declaration. 
  # What we're really interested in is that it ensures a POST request to /users 
  # is handled by the "create" action. 
  resources :users
  #and because we've added the route for user display, we don't need the following : 
  #get "users/new"
  
  #Similarly, set up "sessions" as a resource. 
  resources :sessions, only: [:new, :create, :destroy]
  
  #special one here, to route root directly to the home method of the StaticPagesController.
  root to: 'static_pages#home'
  
  #takes a page "alias" (ex: "/about_path", as used in static_pages_spec.rb) 
  # and routes it to an action (#about) of a controller (static_pages)
  # I can use the via: option to match multiple verbs, or just use the verb itself 
  # instead of 'match'
  #NB that we get a named variable for free with each of these : 
  # so we can use either '/about' or about_path (without quotes!) in a link_to method.
  match '/about', to: 'static_pages#about', via: [:get, :post]
  match '/contact', to: 'static_pages#contact', via: [:get, :post]
  match '/help', to: 'static_pages#help', via: [:get, :post]
  match '/home', to: 'static_pages#home', via: [:get, :post]
  
  #and here are the user-page path(s) : 
  match '/signup', to: 'users#new', via: [:get, :post]
  #and the authentication (sessions) routes : 
  match '/signin', to: 'sessions#new', via: [:get, :post]
  match '/signout', to: 'sessions#destroy', via: [:delete] #restrict to HTTP DELETE request
  
  # where does users#new come from? Why, from the Users resource we defined earlier in this page -- 
  # this path is one of the RESTful routes it provides. 
  
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
