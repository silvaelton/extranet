Wiki::Engine.routes.draw do
  resources :topics, path: 'topicos' do
    resources :pages, path: 'paginas'
    resources :page_users, path: 'paginas-usuarios'
  end
  resources :tooltips, path: 'ferramentas'
  resources :tooltip_categories, path: 'ferramenta-categorias'
end
