Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  scope "(:locale)", :locale => /en|fr/ do
    root to: 'pages#index'
    get "pages/index"
  end

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  resources :users
  resources :posts
  resources :comments

  match '*a', :to => 'errors#routing', via: :get
end