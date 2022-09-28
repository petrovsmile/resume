# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #JOYSTICK
  get 'joystick' => 'joysticks#show'
  post 'joysticks/event' => 'joysticks#event'


  root 'index#index'
end
