require_dependency 'entity/application_controller'

module Entity
  class AppsController < ApplicationController 
    
    def show
      @iframe_url = (Rails.env.development? || Rails.env.test?) ? "http://localhost:3001/entity" : "http://app.codhab.df.gov.br/entity"
      @entity     =  Entity::Cadastre.find(params[:id])
    end 

  end
end