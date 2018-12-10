Rails.application.routes.draw do
  devise_for :users

	root 'residences#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :residences do
    	resources :weeks
    end

    resources :weeks do
    		resource :sales
    end

    resources :users do
            resource :sales
    end
    resources :weeks do
            resource :inscriptions
    end
    resources :sales, only: [:index]
    resources :inscriptions, only: [:index]

    get 'weekList', to: 'weeks#weekList', as: :weekList
  
    resources :usuarios

end
