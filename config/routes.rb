Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"


  resources :items do
    collection do
      get 'search'
      get 'children'
      get 'grandchildren'
    end
  end

  resources :users, only: [:show, :index] do
    collection do
    get "cards"
    end
  end
  resources :users, only: [:show, :index]

  resources :category, only: [:new]

  resources :purchases, only: [:show] do
    collection do
      post "pay"
    end
    member do
      patch "done"
    end
  end
  
  resources :signup ,only: [:index, :create] do
    collection do
      get 'registration1'
      get 'registration2'
      get 'registration3'
      get 'registration4'
      get 'complete' 
    end
  end
  resources :homes, only: [:show, :edit] do
    collection do
      get 'listing'
    end
  end
  resources :cards, only: [:new, :show] do
    collection do
      post 'show'
      post 'pay'
      post 'delete'
    end
  end
end
