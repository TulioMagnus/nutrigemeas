# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboard/welcome#index'

  namespace :dashboard do
    get 'welcome/index'
    get 'statistics/index'
    resources :patients do
      resources :appointments do
        member do
          get 'duplicate'
        end
      end
    end
  end
  get 'tags/:tag', to: 'patients#index', as: :tag

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
