Rails.application.routes.draw do
  resources :classification_votes
  resources :tasks
  resources :workflows
  resources :classifications
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :tutorial_steps
  resources :message_votes
  resources :messages
  resources :candidates
  resources :news
  resources :levels

  devise_for :admins
  as :admin do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
