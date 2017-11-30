Rails.application.routes.draw do

  resources :tracks, only: %i[new  create  edit  show  update  destroy]
  resources :albums, only: %i[edit  show  update  destroy]
  resources :bands, only: %i[index new  create  edit  show  update  destroy]
  resources :bands do
    resources :albums, only: %i[index new create]
  end
  resources :users, only: %i[new create show]
  resource :session, only: %i[new create destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
