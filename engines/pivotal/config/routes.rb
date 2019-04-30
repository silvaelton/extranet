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
    resources :user_group_permission_navs
    resources :user_group_permission_engines
    resources :user_permissions
    

    resources :tickets
    resources :logs
    resources :session_logs
  end

  resources :permission_groups

  resources :system_engines do
    resources :engine_permissions
  end

  resources :sectors, path: 'setores'
  resources :jobs,    path: 'cargos'

  resources :navs,    path: 'menus'

  get 'inactivate',     to: "users#inactivate",     as: 'inactivate'
  get 'reset_password', to: "users#reset_password", as: 'reset_password'
end
