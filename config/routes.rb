Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  resources :items
  resources :users, only: [:index, :edit, :update, :create]
  devise_scope :user do
    get    'signup',                to: 'users/registrations#index'
    get    'signup/registration',   to: 'users/registrations#new'
    get    'signup/sms_confirmation',      to: 'users/confirmations#new'
    get    'signup/sms_confirmation',      to: 'users/confirmations/sms#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


