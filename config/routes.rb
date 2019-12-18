Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :teams, only: [:index, :show, :create, :update, :destroy]
      resources :positions, only: [:index, :show, :create, :update, :destroy]
      resources :user_roles, only: [:index, :show, :create, :update, :destroy]
      resources :roles, only: [:index, :show]
    end
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html