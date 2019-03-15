Cms::Engine.routes.draw do

  resources :posts, path: 'postagens'
  resources :post_categories, path: 'categoria-postagens'
  resources :post_category_types, path: 'tipo-categoria-postagens'
  resources :navs, path: 'menus'
  resources :nav_categories, path: 'categoria-menus'
  resources :nav_category_types, path: 'tipo-categoria-menus'
  resources :archives, path: 'arquivos'

end
