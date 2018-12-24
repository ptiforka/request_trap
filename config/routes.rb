Rails.application.routes.draw do

  match '/:trap_id', to: 'rooms#trap', via: :all
  get '/:trap_id/requests', to: 'rooms#show'
  root 'rooms#index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end