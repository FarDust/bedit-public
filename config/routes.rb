Rails.application.routes.draw do
  # devise_for :users
  devise_for(:users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations' })
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root('welcome#index')
  post('/search', to: 'welcome#search')
  get('/forum', to: 'forums#index')
  resources :communities
  post('/commentaries', to: 'commentaries#create')
  post('/favourites', to: 'favourites#create')
  patch('/subscribe', to: 'favourites#subscribe')
  resources(:favourites)
  root(to: 'pages#index')
  resources(:posts)
  resources :commentaries do
    member do
      put('like', to: 'commentaries#vote')
    end
  end
end
