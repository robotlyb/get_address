GetAddress::Application.routes.draw do
	match "/signup", to: 'users#new', via: 'get'
#	match '/show', to: 'users#show', via: 'get'
	match '/help', to: 'static_pages#help', via: 'get'
	match '/about', to: 'static_pages#about', via: 'get'
	match '/contact', to: 'static_pages#contact', via: 'get'
	root to: 'static_pages#home'
#	post '/:name'=> 'users#create'
	resources :sessions, only: [:new, :create, :destroy]
	resources :users
	match '/signin', to: 'sessions#new', via: 'get'
	match '/signout', to: 'sessions#destroy', via: 'delete'
  get '/show_my_question' => 'users#show_my_question', :as => "myquestion"
	get '/show_my_answered_question' => 'users#show_my_answer_question', :as => "answeredquestion"
	get '/show_my_plan' => 'users#show_my_plan', :as => "myplan"
	get '/show_my_comment_question' => 'users#show_my_comment_plan',:as => "commentplan"

	resources :questions
	match "/ask_question", to: 'questions#new', via: 'get' 
# The priority is based upon order of creation:
  # first created -> highest priority.
  get "/questions_show" => 'questions#index', :as => "questions_show"

	resources :answers
	get "/edit_answer"=> 'answers#new', :as => "edit_answer"
  match "/show_answers_to_the_question", to: 'answers#index', via: 'get' 	
	
	resources :plans
	get "/edit_plan" => 'plans#new', :as => "share_plan"
	get "/show_all_plans" => 'plans#index', :as => "show_all_plans"
	get "/show_search_plan" => 'plans#show_search_result', :as => "show_search_plan"

	resources :comments
	get "/edit_comment" => 'comments#new', :as => "edit_comment"
	

	resources :searches
	post "/searches" => 'searches#create', :as => "search_plan"
	
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
