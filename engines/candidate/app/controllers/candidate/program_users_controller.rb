require_dependency "candidate/application_controller"

module Candidate
  class ProgramUsersController < ApplicationController
    before_action :set_program
    before_action :set_program_users
    before_action :set_program_user, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @program_user = @program.program_users.new
    end

    def create
      @program_user = @program.program_users.new(set_params)
      @program_user.save
    end

    def edit; end

    def update
      @program_user.update(set_params)
    end

    def destroy
      @program_user.destroy
    end

    private

    def set_params
      params.require(:program_user).permit(:program_id, :user_id, :ticket_id, :observation )
    end
    
    def set_program
      @program = Candidate::Program.find(params[:program_id])
    end

    def set_program_users
      @pagy, @program_users = pagy(apply_scopes(Candidate::ProgramUser).all)
    end

    def set_program_user
      @program_user = @program.program_users.find(params[:id])
    end

  end
end