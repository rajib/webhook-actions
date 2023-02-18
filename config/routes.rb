Rails.application.routes.draw do  
  # resources :builds
  get 'webhook_actions/:id/delete' => 'webhook_actions#destroy', as: 'webhook_actions_delete'
  resources :webhook_actions do
    resources :builds, only: [:create, :show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
