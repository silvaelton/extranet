Api::Engine.routes.draw do

  namespace :v1, defaults: { format: :json }  do
    namespace :candidate do
      resources :cadastres
    end

    namespace :attendance do 
    end

    namespace :entity do 
    end

    namespace :external do
      resources :cadastres
    end
  end

end
