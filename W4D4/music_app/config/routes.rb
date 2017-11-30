Rails.application.routes.draw do

  # 
  # get 'bands/index'  ## get 'bands/create'
  # 
  # get 'bands/new'
  # 
  # get 'bands/edit'
  # 
  # get 'bands/show'
  # 
  # get 'bands/update'
  # 
  # get 'bands/destroy'

  resources :tracks, only: %i[new  create  edit  show  update  destroy]
  resources :albums, only: %i[new  create  edit  show  update  destroy]
  resources :bands, only: %i[index new  create  edit  show  update  destroy]
  resources :users, only: %i[new create show]
  resource :session, only: %i[new create destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
