Brails::Application.routes.draw do

  get "home/index"
  devise_for :users, :path_names => {
    :sign_in => 'login', 
    :sign_out => 'logout', 
    :password => 'secret', 
    :confirmation => 'verification',
    :root_path => 'home#index'
  }

  resources :users
  resources :requests
  resources :levels do
    resources :topics 
    resources :bonus_rounds
  end  

  match '/topics/attempt_question/:question_id' => 'topics#attempt_question', as: :attempt_question
  match '/users/:user_id/profile' => 'users#profile', :via => [:get, :post], as: :profile
  match '/levels_list' => 'levels#levels_list', :via => :get, as: :levels_list
  match '/nominate' => 'home#nominate', :via => [:get, :post], as: :nominate
  match 'nominate_list' => 'home#nominate_list', :via => :get, as: :nominate_list

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
  root :to => 'levels#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  match ':action' => 'static#:action'
end
