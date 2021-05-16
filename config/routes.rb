Rails.application.routes.draw do
  namespace :v1 do
    resources :restaurants, only: [:index, :show] do
      resources :menus, only: [:index, :show]
    end
  end
end
