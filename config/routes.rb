Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  resources :items, only: [:new, :create , :edit, :update]

  resources :signup do
    collection do
      get 'registration1'
      get 'registration2'
      get 'registration3'
      get 'registration4'
      get 'complete' 
    end
  end
end
