Rails.application.routes.draw do

  get('/moderate', to: 'moderate#index')

  get('communities/moderator')
  post('administrate/approve')
  post('administrate/refuse')
  post('administrate/delete_user')
  root('welcome#index')
  mount Notifications::Engine => "/notifications"
  # Config Devise
  devise_for(:users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  })
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post('/search', to: 'welcome#search')
  get('/forum', to: 'forums#index')
  get('/rankings/users', to: 'rankings#users')
  get('/rankings/posts', to: 'rankings#posts')
  get('/rankings/categories', to: 'rankings#categories')
  resources :communities
  post('/commentaries', to: 'commentaries#create')
  post('/favourites', to: 'favourites#create')
  delete('/favourites', to: 'favourites#delete')
  patch('/subscribe', to: 'favourites#subscribe')


  resources(:favourites)
  resources(:administrate)
  root(to: 'pages#index')
  resources(:posts)
  resources :posts do
    member do
      put('like', to: 'posts#like')
      put('dislike', to: 'posts#dislike')
    end
  end
  resources :commentaries do
    member do
      put('like', to: 'commentaries#like')
      put('dislike', to: 'commentaries#dislike')
    end
  end
end
