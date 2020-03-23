# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :dashboard do
    get 'pacients/index'
  end
  root 'dashboard/welcome#index'
  namespace :dashboard do
    get 'welcome/index'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
