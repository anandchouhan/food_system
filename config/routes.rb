Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'
  
  resources :owners do
    resources :users, :food_fees  do
      resources :user_fees 
    end
  end 

  resources :users do
    resources :entries
  end

end

