ExerciseApp::Application.routes.draw do
	resources :categories do
		collection do
			get :picture
			get :displayall
		end
		member do
			get :display
		end
	end
	
	resources :glossaries do
		collection do
			get :display
		end
		member do
			get :expand
			get :collapse
		end
	end
	
	resources :optional_accessories do
		collection do
			get :display
		end
		member do
			get :expand
			get :collapse
		end
	end
 	
 	resources :general_tips do
		collection do
			get :display
		end
		member do
			get :expand
			get :collapse
		end
	end
 	resources :positions

	resources :anchor_point_heights
	
	resources :target_muscles
	
	resources :forces
	
	resources :forces
	
	resources :posts
	
	resources :exercises do
		member do
			get :expand
			get :collapse
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
	
	resources :tips
		
	resources :variations

	resources :workouts do
		member do
      get :likepage
      get :display
    end
	end
	
  get "pages/home"

  get "pages/help"

  get "pages/contact"
	root :to => 'categories#index'
end
