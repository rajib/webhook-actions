Rails.application.routes.draw do  
  # resources :builds
  resources :webhook_actions do
    resources :builds, only: [:create, :show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
