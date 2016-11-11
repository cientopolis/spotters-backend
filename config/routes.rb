Rails.application.routes.draw do
  namespace :api, constraints: lambda { |req| req.format == :json } do
    namespace :v1 do
      post 'users.json' => 'users#sync'
      post 'users/tutorial.json' => 'users#tutorial'
      get 'users/tutorial_complete.json' => 'users#tutorial_complete'
      resources :confs, only: [:index, :show]
      resources :tutorial_steps, only: [:index, :show]
      resources :news, only: [:index, :show]
      resources :workflows, only: [:index, :show] do
        resources :tasks, only: [:index, :show]
      end
      resources :candidates, only: [:index, :show, :create, :update, :destroy] do
        resources :classifications, only: [:index, :show, :create, :update, :destroy] do
          resources :classification_votes, only: [:index, :show, :create, :update, :destroy]
        end
        resources :messages, only: [:index, :show, :create, :update, :destroy] do
          resources :message_votes, only: [:index, :show, :create, :update, :destroy]
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
