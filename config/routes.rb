Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'game.list', to: 'game#list'
  get 'game.new', to: 'game#new'
  post 'game.join', to: 'game#join'
  post 'game.move', to: 'game#move'
  post 'game.board', to: 'game#board'
  post 'game.giveup', to: 'game#giveup'
end
