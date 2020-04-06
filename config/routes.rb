# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :dashboard do
    get 'statistics/index'
  end
  root 'dashboard/welcome#index'

  namespace :dashboard do
    get 'welcome/index'
    resources :pacients do
      resources :appointments
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
