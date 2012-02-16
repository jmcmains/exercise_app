ExerciseApp::Application.routes.draw do
	resources :categories do
		collection do
			get :picture
		end
	end
	
	resources :optional_accessories
 	
 	resources :positions

	resources :anchor_point_heights
	
	resources :target_muscles
	
	resources :forces
	
	resources :forces
	
	resources :posts
	
	resources :exercises

	resources :videos
	
	resources :tips
		
	resources :variations

	resources :workouts do
		member do
      get :likepage
    end
	end
	
  get "pages/home"

  get "pages/help"

  get "pages/contact"
	root :to => 'categories#index'
end
