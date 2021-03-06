LatinFoods::Application.routes.draw do

  get "videos/index"
  
  devise_for :users, :controllers => { :registrations => "registrations" }

  devise_for :users
  devise_scope :users do
     get '/users/sign_out' => 'devise/sessions#destroy'
  end

  match '/home/save_details/#{}', :to => 'home#save_details'
  match '/devise/home/contact', :to => 'home#contact'

  resources :statistics
  resources :roles
  resources :users_admin
  resources :reports do
    member do
      get 'generatereport'
    end
  end
  resources :videos do
    member do
      post :add_comment
      get :removevideo
    end     
    new do
       post :upload
       get  :save_video
     end
  end
  resources :qualityinventory
  match "videos/:id/add_comment", :to => "videos#add_comment"

  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   authenticated :user do
    root :to => 'profileinfo#personalinfo'
   end
   root :to => 'home#index'
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id))(.:format)'
end
