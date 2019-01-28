Pivotal::Engine.routes.draw do
  root 'dashboard#index'

  resources :sessions, except: [:edit, :update, :show], path: 'acesso'
  resources :users, path: 'usuarios' do
    resources :bookmarks
    collection do 
      resources :passwords
    end 
    resources :tickets
    resources :logs
    resources :session_logs
  end

  resources :staffs
end
