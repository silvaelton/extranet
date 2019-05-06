module Attendance
  class TermsController < ApplicationController
    before_action :set_term, only: [:edit, :update, :destroy, :show]
    before_action :set_terms

    def index
    end 

    def new
      @term = Attendance::Term.new
    end
    
    def create
      @term = Attendance::Term.new(set_params)
      @term.save
    end

    def show 
    end

    def edit
    end 

    def update
      @term.update(set_params)
    end 

    def destroy
      @term.destroy
    end 

    private

    def set_params
      params.require(:term).permit(:title, :content, :status)
    end

    def set_term
      @term = Attendance::Term.find(params[:id])
    end

    def set_terms
      @terms = Attendance::Term.all.order(:id)
    end
  end
end