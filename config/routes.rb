VimtweetsCom::Application.routes.draw do
  resources :tips, only: [:index]
end
