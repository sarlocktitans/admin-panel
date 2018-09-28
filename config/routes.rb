Rails.application.routes.draw do

  
  devise_for :users
 
    get 'admin',           to:'admin/dashboard#index'  
    get 'assosiate',       to:'admin/users#user_assosiate'
    post 'assosiate',      to:'admin/users#user_assosiate'
    get 'admin/new_bus',   to:'admin/buses#new'
    post 'admin/new_bus',  to:'admin/buses#create'
    get 'admin/new_car',   to:'admin/cars#new'
    post 'admin/new_car',  to:'admin/cars#create'
    get 'admin/bus',       to:'admin/buses#index'
    get 'admin/car',       to:'admin/cars#index' 
    get 'admin/user',      to:'admin/users#index'
    get 'admin/new_user',  to:'admin/users#new'
    post 'admin/new_user', to:'admin/users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
