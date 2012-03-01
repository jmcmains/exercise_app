ExerciseApp::Application.routes.draw do
  get "users/new"

	resources :categories do
		collection do
			get :picture
		end
		member do
      get :likepage
    end
	end
	match '/search' => 'categories#search'
	
	resources :glossaries do
		member do
			get :expand
			get :collapse
		end
	end
	
	resources :optional_accessories do
		member do
			get :expand
			get :collapse
		end
	end
 	
 	resources :general_tips do
		member do
			get :expand
			get :collapse
		end
	end
 	
	resources :exercises do
		member do
			get :expand
			get :collapse
      get :likepage
		end
	end

	resources :videos do
		member do
			get :display
		end
	end
	
	resources :exercise_pictures  do
		member do
			get :display
		end
	end
	
	resources :workouts do
		member do
      get :likepage
    end
	end
	match '/signup',  to: 'users#new'
  match '/home', to: 'pages#home'
	root to: 'categories#index'
end
