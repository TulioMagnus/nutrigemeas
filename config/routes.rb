# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboard/welcome#index'

  namespace :dashboard do
    get 'welcome/index'
    get 'statistics/index'
    resources :patients do
      resources :appointments do
        resources :skin_folds
        member do
          get 'duplicate'
        end
      end
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
