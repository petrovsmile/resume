# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #JOYSTICK
  post 'joysticks/event' => 'joysticks#event'

  
  resources :joysticks, only: [:show]
  resources :portfolio, only: [ :show ]
  root 'index#index'
end
