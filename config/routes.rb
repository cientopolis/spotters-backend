Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api, constraints: lambda { |req| req.format == :json } do
    namespace :v1 do
      resources :tutorial_steps
      resources :news
      resources :levels
      resources :workflows do
        resources :tasks
      end
      resources :candidates do
        resources :classifications do
          resources :classification_votes
        end
        resources :messages do
          resources :message_votes
        end
      end
    end
  end

  devise_for :admins
  as :admin do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
