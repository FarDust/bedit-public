Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/login', to: 'users#new'
  post '/login', to: 'users#create'
  delete '/logout' , to: 'users#destroy'
# resourses :users
end
