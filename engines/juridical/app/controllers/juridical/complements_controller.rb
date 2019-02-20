require_dependency 'juridical/application_controller'

module Juridical
  class ComplementsController < ApplicationController
    before_action :set_legal_advice, except: [:update_status, :resend_email]
    before_action :set_complements, only: [:index, :create, :destroy, :update]
    before_action :set_complement, only: [:edit, :destroy, :update, :show]

    def index
      @user = current_user
    end

    def new
      @complement = @legal_advice.complements.new
    end

    def create
      @complement = @legal_advice.complements.new(complement_params)
      @complement.staff_id = current_user.id
      @complement.save
      begin
       Juridical::InformationMailer.open_complement(@complement).deliver_now! if @complement.responsible_lawyer_id.present?
      rescue
      end
    end

    def resend_email
      @complement = Juridical::Complement.find(params[:complement_id])
      if @complement.present?
        if @complement.responsible_lawyer_id.present?
          begin
           Juridical::InformationMailer.open_complement(@complement).deliver_now!
           flash[:success] = "Email reenviado com sucesso."
          rescue
            flash[:warning] = "Problemas no envio de email"
          end

        else
          flash[:warning] = "Nenhum advogado selecionado como responsével."
        end

      end
      redirect_to legal_advice_complements_path(@complement.legal_advice_id)
    end

    def update_status
       @complement = Juridical::Complement.find(params[:complement_id])
       @complement.status == true ? @complement.status = false : @complement.status = true
       @complement.save
       redirect_to legal_advice_complements_path(@legal_advice.id)
    end

    def edit; end

    def update
      @complement.update(complement_params)
    end

    def destroy
      @complement.destroy
    end

    private

    def complement_params
      params.require(:complement).permit(:document_type_id, :lawsuit_id, :instancy_place_id,
                                         :distribution_date, :end_date, :complement,
                                         :responsible_lawyer_id, :advice_type_id, :file_path, :status,
                                         :complement_father_id, :legal_advice_id)
    end

    def set_complements
      @complements = @legal_advice.complements.all
    end

    def set_complement
      @complement = Juridical::Complement.find(params[:id])
    end

    def set_legal_advice
      @legal_advice = Juridical::LegalAdvice.find(params[:legal_advice_id])
    end
  end
end
