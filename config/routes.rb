Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:index, :show, :create, :destroy, :update]
      resources :teams, only: [:index, :show, :create, :destroy, :update]
      resources :positions, only: [:index, :show, :create, :destroy, :update]
      resources :user_roles, only: [:index, :show, :create, :destroy, :update]
      resources :roles, only: [:index, :show, :create, :destroy, :update]
    end
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html