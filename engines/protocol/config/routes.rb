Protocol::Engine.routes.draw do
  root 'assessments#index'
  
  resources :assessments, path: 'autuacoes'
end
