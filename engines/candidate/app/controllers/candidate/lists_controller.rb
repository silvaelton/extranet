require_dependency "candidate/application_controller"

module Candidate
  class ListsController < ApplicationController
    before_action :set_lists
    before_action :set_list, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name

    def index;end

    def show; end

    def new
      @list = Candidate::List.new
    end

    def create
      @list = Candidate::List.new(set_params)
      @list.save
    end

    def edit; end

    def update
      @list.update(set_params)
    end

    def destroy
      @list.destroy
    end

    private

    def set_params
      params.require(:list).permit(:name, :description, :sql, :view_columns, :detail, :detail_column, :detail_field_param, 
                                   :detail_url, :detail_target_blank, :filter, :filter_fields, :filter_field_labels, 
                                   :row_count, :status, :program_id, :sub_program_id, :external, :extract_xls, :extract_csv, 
                                   :slug)
    end

    def set_lists
      @pagy, @lists = pagy(apply_scopes(Candidate::List).all)
    end

    def set_list
      @list = Candidate::List.find(params[:id])
    end

  end
end