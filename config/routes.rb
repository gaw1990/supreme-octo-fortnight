Rails.application.routes.draw do
  resources :loans, defaults: {format: :json}
  resources :payments, only: [:show, :index, :create], defaults: {format: :json}
end
