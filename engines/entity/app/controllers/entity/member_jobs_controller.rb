require_dependency 'entity/application_controller'

module Entity
  class MemberJobsController < ApplicationController
    before_action :set_member_jobs
    before_action :set_member_job, only: [:edit, :update, :destroy]

    def index; end
    
    def new
      @member_job = Entity::MemberJob.new
    end
    
    def create
      @member_job = Entity::MemberJob.new(set_params)
      @member_job.save
    end
    
    def edit; end

    def update
      @member_job.update(set_params)
    end

    def destroy
      @member_job.destroy
    end

    private
    
    def set_member_jobs
      @member_jobs = Entity::MemberJob.all.order(:id)
    end

    def set_params
      params.require(:member_job).permit(:name, :description, :status)
    end

    def set_member_job
      @member_job = Entity::MemberJob.find(params[:id])
    end
  end
end