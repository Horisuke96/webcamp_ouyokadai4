Rails.application.routes.draw do

  devise_for :users
# deviseは先
  resources :users,only: [:show,:index,:edit,:update]

  resources :books, only: [:new, :create, :edit, :update, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]

  root 'homes#top'
  get '/home/about' => 'homes#about'
end