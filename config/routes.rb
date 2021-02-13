Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users,only: [:show,:edit,:update,:index] do
    resources :relationships, only: [:create, :destroy]
    get "/following_users" => "relationships#following", as: "following"
    get "/followed_users" => "relationships#followed", as: "followed"
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :rooms, only: [:show, :index]
  post "/set_room" => "rooms#set_room", as: "set_room"

  resources :chats, only: [:create]

  post "/search_contents" => "search#search_contents", as: "search_contents"
  root 'home#top'
  get 'home/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
