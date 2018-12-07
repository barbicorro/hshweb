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
            get 'reserveList', to: 'users#reserveList', as: :reserveList
            get 'indexAdmin', to: 'users#indexAdmin', as: :indexAdmin
            get 'change_base', to: 'users#change_base', as: :change_base
            get 'change_premium', to: 'users#change_premium', as: :change_premium
            get 'change_admin', to: 'users#change_admin', as: :change_admin

    end
    resources :weeks do
            resource :inscriptions
    end
    resources :sales, only: [:index]
    resources :inscriptions, only: [:index]


    get 'faq', to: 'residences#faq', as: :faq



end
