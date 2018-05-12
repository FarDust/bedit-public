Rails.application.routes.draw do
  # devise_for :users
  devise_for(:users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations' })
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root('welcome#index')
  get('/susses', to: 'message#index')
  get('/forum', to: 'forums#index')
  get('/posts/:id', to: 'forums#mostrar')
  post('/commentaries', to: 'commentaries#create')
  root(to: 'pages#index')
  resources :posts do
    collection do
    end
  end
end
