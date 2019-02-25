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
      params.require(:job).permit(:name)
    end

    def set_job
      @job = Pivotal::Job.find(params[:id])
    end

    def set_jobs
      @jobs = Pivotal::Job.all.order(:name)
    end
  end
end