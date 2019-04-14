require_dependency 'attendance/application_controller'

module Attendance
  class EventualCadastresController < ApplicationController
    before_action :set_eventuals
    before_action :set_eventual, only: %i[edit update destroy]

    has_scope :by_name
    has_scope :by_cpf
    
    def index; end
    
    def new
      @eventual = Attendance::EventualCadastre.new
    end
    
    def create
      @eventual = Attendance::EventualCadastre.new(set_params)
      @eventual.user_id = current_user.id
      @eventual.convocation_id = @eventual.convocation_id
      @eventual.save
    end
     
    def edit; end

    def update
      @eventual.update(set_params)
    end

    def destroy
      @eventual.destroy
    end

    private

    def set_params
      params.require(:eventual_cadastre)
        .permit(:name, :cpf, :gender_id, :program_id, :born, :convocation_id, :observation, 
                :password, :password_confirmation, :sub_program_id,:situation_id)
    end

    def set_eventuals
      @pagy, @eventuals = pagy(apply_scopes(Candidate::Cadastre).joins(:cadastre_situations).where('candidate_cadastre_situations.situation_type_id in (2,11)'))
    end

    def set_eventual
      @eventual = Candidate::Cadastre.find(params[:id])
    end

  end
end