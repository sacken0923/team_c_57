Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"

  resources :items, only: [:new, :create , :edit, :update, :show] do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :index]
  resources :purchases
  
  resources :signup ,only: [:index, :create] do
    collection do
      get 'registration1'
      get 'registration2'
      get 'registration3'
      get 'registration4'
      get 'complete' 
    end
  end
  resources :homes, only: [:show, :edit]
  resources :cards, only: [:new, :show] do
    collection do
      post 'show'
      post 'pay'
      post 'delete'
    end
  end
end
