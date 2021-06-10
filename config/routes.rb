Rails.application.routes.draw do
  namespace :v1 do
    resources :users
    resources :sessions, only: [:index, :create, :show, :destroy]
    resources :cuisines
    resources :restaurants
    resources :menus
    resources :courses
    resources :course_items
    resources :course_item_refinements
    resources :operation_hours
  end
end
