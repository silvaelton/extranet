Candidate::Engine.routes.draw do
  root 'dashboard#index'

  resources :cadastres, path: 'cadastros'
  resources :activity_types
end
