require_dependency "candidate/application_controller"

module Candidate
  class IptusController < ApplicationController
    before_action :set_iptus
    before_action :set_iptu, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_cpf

    def index;end

    def show; end

    def new
      @iptu = Candidate::Iptu.new
    end

    def create
      @iptu = Candidate::Iptu.new(set_params)
      @iptu.save
    end

    def edit; end

    def update
      @iptu.update(set_params)
    end

    def destroy
      @iptu.destroy
    end

    private

    def set_params
      params.require(:iptu).permit(:name, :cpf, :registration, :city, :address, :kind_realty,
                                   :kind_search, :year, :realty_codhab)
    end

    def set_iptus
      @pagy, @iptus = pagy(apply_scopes(Candidate::Iptu).all)
    end

    def set_iptu
      @iptu = Candidate::Iptu.find(params[:id])
    end

  end
end