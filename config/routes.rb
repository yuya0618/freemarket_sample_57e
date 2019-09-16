Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'items#index'

  resources :items do
    member do
      get 'buy'
      post 'purchase'
      get 'complete'
    end
    collection do
      get 'searchChild'
      get 'searchGchild'
      get 'children'
      get 'gchildren'
      get 'size'
      get 'brand'
      get 'brand_search'
      get 'delivery_method'
      get 'search'
    end
    resources :images, only: [:index, :create, :delete]
  end

  resources :users, only: [:index, :edit, :update, :create] do
    member do
      get 'list'
      get 'payment'
    end
    resources :credit_cards, only: [:new, :show, :delete] do
      collection do
        post 'show', to: 'credit_cards#show'
        post 'pay', to: 'credit_cards#pay'
        post 'delete', to: 'credit_cards#delete'
      end
    end
  end


  devise_scope :user do
    get 'signup',                  to: 'users/registrations#new'
    get    'signup/registration',   to: 'users/registrations#step1'
    get    'signup/sms_confirmation',      to: 'users/registrations#step2'
    get    'users/sign_out',        to: 'users#to_destroy'
    get    'signup/sms_confirmation/sms',      to: 'users/registrations#step3'
    get    'signup/address',               to: 'users/registrations#step4'
    get    'signup/credit',         to: 'users/registrations#step5'
    post    'signup/registration/create',         to: 'users/registrations#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'identification', to: 'identifications#edit', as: :identification

end
