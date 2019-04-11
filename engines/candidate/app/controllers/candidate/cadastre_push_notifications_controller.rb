require_dependency 'candidate/application_controller'

module Candidate
  class CadastrePushNotificationsController < ApplicationController
    before_action :set_cadastre

    def new
      @push_notification = Candidate::CadastrePushNotification.new
    end
    
    def create
      @push_notification = Candidate::CadastrePushNotification.new(set_params)
      @push_notification.user_id = current_user.id
      @push_notification.cadastre_id = params[:cadastre_id]
      @push_notification.save
    end 

    private

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
    end

    def set_params
      params.require(:cadastre_push_notification)
            .permit(:content, :title)
    end
  end
end