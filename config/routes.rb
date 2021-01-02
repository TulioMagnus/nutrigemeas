# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboard/welcome#index'

  namespace :dashboard do
    get 'welcome/index'
    get 'statistics/index'
    resources :patients do
      resources :appointments do
        match '/destroy', to: 'appointments#destroy', via: :delete
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
