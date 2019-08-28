Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :signup do
    collection do
      get 'registration0'
      get 'registration1'
      get 'registration2'
      get 'registration3'
      get 'registration4'
      get 'complete' 
    end
  end
end
