# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #JOYSTICK
  get 'joystick/:hash_code' => 'joysticks#show'
  post 'joysticks/event' => 'joysticks#event'

  post '/send_contact_form' => 'form#send_form'

  root 'index#index'
end
