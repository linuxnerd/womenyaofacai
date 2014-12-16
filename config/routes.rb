Rails.application.routes.draw do
  root 'productions#index'

  resource :productions, only: [:show, :index]
end
