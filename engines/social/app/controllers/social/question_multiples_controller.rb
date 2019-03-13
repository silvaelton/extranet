require_dependency 'social/application_controller'

module Social
  class QuestionMultiplesController < ApplicationController
    before_action :set_question
    before_action :set_question_multiples
    before_action :set_question_multiple, only: %i[edit update destroy show]

    def index; end

    def new
      @question_multiple = @question.question_multiples.new
    end

    def create
      @question_multiple = @question.question_multiples.new(set_params)
      @question_multiple.save
    end

    def edit; end

    def update
      @question_multiple.update(set_params)
    end

    def destroy
      @question_multiple.destroy
    end

    def show; end

    private

    def set_params
      params.require(:social_question_multiple).permit(:name, :status)
    end

    def set_question_multiples
      @question_multiples = @question.question_multiples.all
    end

    def set_question
      @question = Social::Question.find(params[:question_id])
    end

    def set_question_multiple
      @question_multiple = @question.question_multiples.find(params[:id])
    end
  end
end
