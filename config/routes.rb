Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :tutorial_steps
  resources :message_votes
  resources :messages
  resources :candidate_votes
  resources :candidates
  resources :news
  resources :levels
  resources :candidate_types

  devise_for :admins
  as :admin do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
