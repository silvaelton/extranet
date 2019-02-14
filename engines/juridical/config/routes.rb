Juridical::Engine.routes.draw do
  resources :legal_advices, path: 'acompanhamentos'  do
     get '/update_status', to: 'legal_advices#update_status',      as: 'update_status'
     resources :complements,  path: 'complementos'
     resources :defendants,   path: 'reu'
     resources :complainants, path: 'autor'
   end
   get '/update_status',   to: 'complements#update_status',     as: 'update_status'
   get '/new_consultive',  to: 'legal_advices#new_consultive',  as: 'new_consultive'
   get '/edit_consultive', to: 'legal_advices#edit_consultive', as: 'edit_consultive'
   get '/resend_email',    to: 'complements#resend_email',      as: 'resend_email'

   get '/instancy_places',        to: 'instancies#instancy_places',      as: 'instancy_places'

   resources :lawsuits,     path: 'tipo-acoes'
   resources :advice_types, path: 'tipo-acompanhamentos'
   resources :instancies,   path: 'instancias' do
     resources :instancy_places, path: 'local-instancias'
   end
end
