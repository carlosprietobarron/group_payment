Rails.application.routes.draw do
  get 'user/show', as: 'user_profile'
  get 'welcome/index'
  devise_for :users
  resources :transactions, except: %i[show]

  get 'transaction/new/:group_id', to: 'transactions#new_with_group', as: 'new_with_group'
  
  get 'transaction/user', to: 'transactions#index_by_user', as: 'index_by_user'

  get 'transaction/group/:group_id', to: 'transactions#index_by_group', as: 'index_by_group'

  get 'home/', to: 'welcome#index', as: 'home'
  resources :groups, except: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
