Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'products/destroy'
      # get 'products/index'
      # get 'products/show'
      # get 'products/create'
      resources :products , only: [:index, :show, :create , :update, :destroy]

    end
  end
  root "hello#index"
end
