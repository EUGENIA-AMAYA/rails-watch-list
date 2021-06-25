Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'lists/new'
  get 'lists/create'
  get 'lists/show'
  get 'lists/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  resources :lists, except: [:edit , :update] do 
    resources :bookmarks, only: [:create, :new]
  end
  resources :bookmarks, only: [:destroy]
end
