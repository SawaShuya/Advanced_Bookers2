Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:edit,:update,:index] do
    resources :relationships, only: [:create, :destroy]
    get "/following_users" => "relationships#following", as: "following"
    get "/followed_users" => "relationships#followed", as: "followed"
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  post "/search_contents" => "books#search_contents", as: "search_contents"
  root 'home#top'
  get 'home/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
