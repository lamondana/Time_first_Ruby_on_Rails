Rails.application.routes.draw do


  #get 'users/new'
  resources :actuals
  resources :classrooms
  resources :users
  resources :pupils
  resources :teachers

  #get 'pupils/index'

  #get 'pupils/show'

  #get 'pupils/new'

  #get 'pupils/edit'

  #get 'pupils/delete'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
