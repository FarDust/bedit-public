Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  root to: 'pages#index'
  resources :posts do
    collection do
    end
  end
end
