Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors do
        get 'publications', to: 'publications#index'
      end
      resources :publications
    end
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
