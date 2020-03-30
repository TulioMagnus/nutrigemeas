# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :dashboard do
    get 'welcome/index'
    resources :pacients, shallow: true do
      resources :appointments
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
