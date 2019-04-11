Pivotal::Engine.routes.draw do
  root 'dashboard#index'

  resources :sessions, except: [:edit, :update, :show], path: 'acesso'
  
  resources :users, path: 'usuarios' do
    resources :bookmarks
    
    collection do 
      resources :passwords
    end 

    resources :reset_passwords
    resources :user_navs
    resources :user_permissions

    resources :tickets
    resources :logs
    resources :session_logs
  end

  resources :system_engines do
    resources :engine_permissions
  end

  resources :sectors, path: 'setores'
  resources :jobs,    path: 'cargos'

  resources :navs,    path: 'menus'
end
