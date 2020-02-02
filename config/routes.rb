# frozen_string_literal: true

Rails.application.routes.draw do
  root controller: :top_page, action: :show
  namespace :api do
    resources :tiles, only: [:index]
  end
end
