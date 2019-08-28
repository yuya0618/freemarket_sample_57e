Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :users, only: [:index, :edit, :update, :create, :to_destroy]
  devise_scope :user do
    get    'signup',                to: 'users/registrations#index'
    get    'signup/registration',   to: 'users/registrations#new'
    get    'signup/sms_confirmation',      to: 'users/confirmations#new'
    get    'users/sign_out',        to: 'users#to_destroy'
    get    'signup/sms_confirmation/sms',      to: 'users/confirmations#index'
    get    'signup/adress',               to: 'users/adresses#new'
    get    'signup/credit',         to: 'users/credits#new'

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
