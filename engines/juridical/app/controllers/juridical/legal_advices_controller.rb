require_dependency 'juridical/application_controller'

module Juridical
  class LegalAdvicesController < ApplicationController
    before_action :set_legal_advice, only: [:show, :edit, :update, :destroy]

    has_scope :process
    has_scope :lawyer
    has_scope :status
    has_scope :by_suitor
    has_scope :by_agency
    has_scope :by_lawsuit
    has_scope :adm_process


    def index
      if params[:utf8].present?
        @legal_advices = Juridical::LegalAdvice.includes([:lawsuit, :complements])
        @legal_advices = apply_scopes(@legal_advices).paginate(:page => params[:page], :per_page => 20)
      end
    end

    def new
       @legal_advice = Juridical::LegalAdvice.new
    end

    def new_consultive
       @legal_advice = Juridical::LegalAdvice.new
    end

    def create
      @legal_advice = Juridical::LegalAdvice.new(set_legal_advice_params)
      @legal_advice.staff_id = current_user.id
      if @legal_advice.save
        flash[:success] = "Acompanhamento incluído com sucesso."
        begin
          Juridical::InformationMailer.open(@legal_advice.responsible_lawyer_id, @legal_advice).deliver_now!
        rescue
          flash[:warning] = "Erro ao enviar email."
        end
        redirect_to legal_advices_path(utf8:'✓' ,process: @legal_advice.process_number)
      else
        redirect_to new_legal_advice_path
      end
    end

    def update_status
       @legal_advice = Juridical::LegalAdvice.find(params[:legal_advice_id])
       @legal_advice.status == true ? @legal_advice.status = false : @legal_advice.status = true
       @legal_advice.save
       redirect_to action: 'index'
    end


    def show
      @return = Juridical::ReturningTribunalService.new(@legal_advice).get_array

      @assessment = Protocol::Assessment.where('description_subject ilike ? ', "%#{@legal_advice.process_number}%").first if @legal_advice.process_number.present?
      @complainants = @legal_advice.complainants.all
      @defendants = @legal_advice.defendants.all

    end

    def edit; end

    def update
      if @legal_advice.update(set_legal_advice_params)
        flash[:success] = "Acompanhamento atualizado."
        redirect_to legal_advices_path
      else
        render action: 'edit'
      end
    end

    def destroy
      @legal_advice.destroy
      redirect_to action: 'index'
    end

    private

     def set_legal_advice
        @legal_advice = Juridical::LegalAdvice.find(params[:id])
     end

     def set_legal_advice_params
      params.require(:legal_advice).permit(:process_number, :agency, :lawsuit_id,:lawsuit_value, :free_justice,
                                           :instancy_place_id, :process_type, :responsible_lawyer_id,
                                           :advice_type_id,:condemnation_value, :verdict, :advice_type_id,:assessment_number,
                                           :document_type_id, :suitor, :status, :description_complement, :start_date, :end_date,
                                           :probability, :procedural_costs, :judicial_deposit)

     end
  end
end
