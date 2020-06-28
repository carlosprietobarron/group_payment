Rails.application.routes.draw do
  post '/friendships/update/:id', to: 'friendships#update', as: 'friend'
  post '/friendships/create/:id', to: 'friendships#create', as: 'create_friend'
  
  get 'user/show', as: 'user_profile'
  get 'user/index', to: 'user#index', as: 'friends_list'
  get 'user/profile/:id', to: 'user#profile', as: 'friend_profile'

  get 'home/index'
  devise_for :users
  resources :transactions, except: %i[show]

  get 'transaction/new/:group_id', to: 'transactions#new_with_group', as: 'new_with_group'
  
  get 'transaction/user', to: 'transactions#index_by_user', as: 'index_by_user'

  get 'transaction/group/:group_id', to: 'transactions#index_by_group', as: 'index_by_group'

  get 'home/', to: 'home#index', as: 'home'
  resources :groups, except: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
