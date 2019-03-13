require_dependency 'social/application_controller'

module Social
  class StepsController < ApplicationController
    before_action :set_steps
    before_action :set_step, only: %i[edit update destroy show]

    def index; end

    def new
      @step = Social::Step.new
    end

    def create
      @step = Social::Step.new(set_params)
      @step.save
    end

    def edit; end

    def update
      @step.update(set_params)
    end

    def destroy
      @step.destroy
    end

    def show; end

    private

    def set_params
      params.require(:step).permit(:name, :status)
    end

    def set_steps
       @steps = Social::Step.all
    end

    def set_step
      @step = Social::Step.find(params[:id])
    end
  end
end
