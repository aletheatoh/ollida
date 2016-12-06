Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'welcome/hello'
  root to: "welcome#hello"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get "api/fake_nominations" => "nominations#fake_nominations"

  resources :nominations
end
