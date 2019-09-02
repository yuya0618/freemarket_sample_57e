Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :images, only: [:index, :create]
  end
  resources :users, only: [:index, :edit, :update, :create]
  devise_scope :user do
    get    'signup',                to: 'users/registrations#index'
    get    'signup/registration',   to: 'users/registrations#step1'
    get    'signup/sms_confirmation',      to: 'users/registrations#step2'
    get    'users/sign_out',        to: 'users#to_destroy'
    get    'signup/sms_confirmation/sms',      to: 'users/registrations#step3'
    get    'signup/address',               to: 'users/registrations#step4'
    get    'signup/credit',         to: 'users/registrations#step5'
    get    'signup/registration/create',         to: 'users/registrations#create'

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
