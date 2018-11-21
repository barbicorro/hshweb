Rails.application.routes.draw do
	root 'residences#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :residences do
    	resources :weeks do 
    		resources :sales
		    		
    	end
    end    
end
