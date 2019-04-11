require_dependency "candidate/application_controller"

module Candidate
  class ProgramsController < ApplicationController
    before_action :set_programs
    before_action :set_program, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @program = Candidate::Program.new
    end

    def create
      @program = Candidate::Program.new(set_params)
      @program.save
    end

    def edit; end

    def update
      @program.update(set_params)
    end

    def destroy
      @program.destroy
    end

    private

    def set_params
      params.require(:program).permit(:name, :description, :status, :sub_program)
    end

    def set_programs
      @pagy, @programs = pagy(apply_scopes(Candidate::Program).all)
    end

    def set_program
      @program = Candidate::Program.find(params[:id])
    end

  end
end