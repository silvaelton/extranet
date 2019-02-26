require_dependency 'person/application_controller'

module Person
  class JobsController < ApplicationController
    before_action :set_jobs
    before_action :set_job, only: %i[edit update destroy]

    has_scope :by_name
    has_scope :by_code
    has_scope :by_status

    def index; end

    def new
      @job = Person::Job.new
    end

    def create
      @job = Person::Job.new(set_params)
      @job.save
    end

    def edit; end

    def update
      @job.update(set_params)
    end

    def destroy
      @job.destroy
    end

    private

    def set_params
      params.require(:job).permit(:name, :code, :status, :salary, :function_code)
    end

    def set_jobs
      @pagy, @jobs = pagy(apply_scopes(Person::Job).all.order(:name))
    end
    
    def set_job
      @job = Person::Job.find(params[:id])
    end

  end
end