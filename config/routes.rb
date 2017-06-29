Rails.application.routes.draw do

get 'events/create'
get 'comments/create'

root 'users#index'

get '/users' => 'users#index', as: :users
get '/users/new' => 'users#new', as: :new_users
get 'users/:id/events' => 'users#show', as: :user
post '/users' => 'users#create'
get '/users/:id/edit' => 'users#edit', as: :edit_user
patch '/users/:id' => 'users#update'
delete '/users/:id' => 'users#destroy'

get '/events' => 'events#index', as: :events
get '/events/new' => 'events#new', as: :new_events
get '/events/:id' => 'events#show', as: :event
post '/events/new' => 'events#create'
patch '/events/:id' => 'events#update'
get '/events/:id/edit' => 'events#edit', as: :event_edit
delete '/events/:id' => 'events#destroy'

get '/events/:id/comments' => 'comments#index', as: :event_comments
get '/events/:id/comments/new' => 'comments#new', as: :event_comment_new
delete '/events/:id/comments' => 'comments#destroy', as: :event_comment_destroy
post 'events/:id/comments' => 'comments#create'

get '/login' => 'sessions#new', as: :login
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy', as: :logout
end
