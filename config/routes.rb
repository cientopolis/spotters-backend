Rails.application.routes.draw do
  namespace :api, constraints: lambda { |req| req.format == :json } do
    namespace :v1 do
      post 'users.json' => 'users#sync'
      resources :confs
      resources :tutorial_steps
      resources :news
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
