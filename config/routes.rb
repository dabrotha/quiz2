Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :ideas

  resources :users, only: [:new, :create]

  resource :sessions, only: [:new, :destroy, :create]

  resources :ideas do
    resources :reviews, only: [:new, :create, :destroy]
  end

end


