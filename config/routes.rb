Rails.application.routes.draw do
  namespace :v1 do
    resources :restaurants, only: [:index]
  end
end
