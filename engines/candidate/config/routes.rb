Candidate::Engine.routes.draw do
  root 'home#index'

  resources :cadastres, path: 'cadastros' do
    resources :cadastre_situations
    resources :cadastre_procedural_situations
    resources :cadastre_convocations
    resources :cadastre_reservations
    resources :cadastre_contacts
    resources :cadastre_general
    resources :cadastre_dependents
    resources :cadastre_inheritors
    resources :cadastre_pontuations
    resources :cadastre_occurrences
    resources :cadastre_indications
    resources :cadastre_schedules
    resources :cadastre_chats
    resources :cadastre_notifications
    resources :cadastre_communications
    resources :cadastre_activities
    resources :cadastre_helps
  end
  
  resources :activity_types
end
