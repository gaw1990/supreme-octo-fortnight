Rails.application.routes.draw do
  resources :loans, only: [:show, :index], shallow: true, defaults: { format: :json } do 
    resources :payments, only: [:show, :create, :index], defaults: { format: :json }
  end
end
