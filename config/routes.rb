Rails.application.routes.draw do

  
  devise_for :users
 
    get 'admin',                 to:'admin/dashboard#index'  
    get 'assosiate',             to:'admin/users#user_assosiate'
    post 'assosiate',            to:'admin/users#user_assosiate'
    
    get 'admin/bus',             to:'admin/buses#index'
    get 'admin/bus/new',         to:'admin/buses#new'
    post 'admin/bus/new',        to:'admin/buses#create'
    get 'admin/bus/edit/:id',    to:'admin/buses#edit'
    post 'admin/bus/edit/:id',   to:'admin/buses#update'
    get 'admin/bus/show/:id',    to:'admin/buses#show'

    get 'admin/car',             to:'admin/cars#index' 
    get 'admin/car/new',         to:'admin/cars#new'
    post 'admin/car/new',        to:'admin/cars#create'
    get 'admin/car/edit/:id',    to:'admin/cars#edit'
    get 'admin/car/edit/:id',     to:'admin/cars#update'
    patch 'admin/car/edit/:id',   to:'admin/cars#update'
    get 'admin/car/show/:id',    to:'admin/cars#show'

    get 'admin/user',            to:'admin/users#index'
    get 'admin/user/new',        to:'admin/users#new'
    post 'admin/user/new',       to:'admin/users#create'
    get 'admin/user/edit/:id',   to:'admin/users#edit'
    get 'admin/user/edit/:id',   to:'admin/users#update'
    patch 'admin/user/edit/:id', to:'admin/users#update'
    get 'admin/users/show/:id',  to:'admin/users#show'

    get 'admin/add_license', to:'admin/users#add_license'

    root 'admin/dashboard/index'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
