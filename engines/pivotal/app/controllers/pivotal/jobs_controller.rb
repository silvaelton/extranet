require_dependency 'pivotal/application_controller'

module Pivotal
  class JobsController < ApplicationController
    before_action :set_jobs
    before_action :set_job, only: [:edit, :update, :destroy]

    def index; end

    def new
      @job = Pivotal::Job.new
    end

    def create
      @job = Pivotal::Job.new(set_params)
      @job.save
    end

    def edit;end

    def update
      @job.update(set_params)
    end

    def destroy
      @job.destroy
    end

    private

    def set_params
      params.require(:job).permit(:name, :code, :function_code, :salary, :status)
    end

    def set_job
      @job = Pivotal::Job.find(params[:id])
    end

    def set_jobs
     @pagy, @jobs = pagy(Pivotal::Job.all.order(:id))
    end
  end
end
