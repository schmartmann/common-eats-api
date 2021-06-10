Rails.application.routes.draw do
  namespace :v1 do
    resources :users
    resources :cuisines
    resources :sessions, only: [:index, :create, :show, :destroy]
    resources :restaurants
    resources :menus
    resources :courses
    resources :course_items
    resources :course_item_refinements

    get '/operation-hours/restaurants', to: 'operation_hours#retrieve_open_restaurants_by_time_zone', as: :retrieve_open_restaurants_by_time_zone
    get '/operation-hours/restaurants/:restaurant_id', to: 'operation_hours#retrieve_restaurant_operation_hours', as: :retrieve_restaurant_operation_hours
    get '/operation-hours/menus/:menu_id', to: 'operation_hours#retrieve_menu_operation_hours', as: :retrieve_menu_operation_hours
  end
end
