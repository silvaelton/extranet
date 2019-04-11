Social::Engine.routes.draw do
  root 'cadastres#index'
  
  resources :cadastres, path: 'cadastros' do
    resources :cadastre_schedules, path: 'agendamentos'
    resources :dependents,         path: 'dependentes'
    resources :answers,            path: 'respostas'
    resources :cadastre_documents, path: 'documentos', only: %i[new create destroy]
  end

  resources :steps, path: 'etapas'
  resources :activity_types, path: 'tipo-atividades'
  resources :cities, path: 'cidades' do
    resources :burghs, path: 'bairros'
  end
  resources :document_types, path: 'tipo-documentos'
  resources :questions, path: 'questoes' do
    resources :question_multiples, path: 'questao-multiplas'
  end
end
