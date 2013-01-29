VimtweetsCom::Application.routes.draw do
  resources :tips, only: [:index]
  root to: 'tips#index'
end
