require_dependency 'social/application_controller'

module Social
  class QuestionsController < ApplicationController
    before_action :set_questions
    before_action :set_question, only: %i[edit update destroy show]

    def index; end

    def new
      @question = Social::Question.new
    end

    def create
      @question = Social::Question.new(set_params)
      @question.save
    end

    def edit; end

    def update
      @question.update(set_params)
    end

    def destroy
      @question.destroy
    end

    def show; end

    private

    def set_params
      params.require(:question).permit(:name, :status)
    end

    def set_questions
       @questions = Social::Question.all
    end

    def set_question
      @question = Social::Question.find(params[:id])
    end
  end
end
