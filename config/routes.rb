# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #JOYSTICK
  post 'joystick/event' => 'joystick#event'

  

  resources :portfolio, only: [ :show ]
  root 'index#index'
end
