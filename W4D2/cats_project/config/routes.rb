Rails.application.routes.draw do
  # get 'cats/index'
  #
  # get 'cats/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :cats, only: [:index, :show, :create, :new, :edit, :update]

end
