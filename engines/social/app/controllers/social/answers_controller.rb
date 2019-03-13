require_dependency 'social/application_controller'

module Social
  class AnswersController < ApplicationController
    before_action :set_cadastre

    def new
      @questions = Social::Question.where(status: true, question_type_id: params[:type])
      @answer = @cadastre.answers.new
    end

    def create
      if params[:multiple_ids].length > 0
        @multiple = Social::QuestionMultiple.find(params[:multiple_ids])
        @multiple.each do |m|
          @answer = @cadastre.answers.new(
            question_multiple_id: m.id,
          )
          @answer.save
        end
        if params[:answer][:description].present?
          @answer = @cadastre.answers.new(
            description: params[:answer][:description]
          )
          @answer.save
        end
      end
    end

    private

    def set_params
      params.require(:answer).permit(:question_id, :description)
    end

    def set_cadastre
      @cadastre = Social::Cadastre.find(params[:cadastre_id])
    end
  end
end
