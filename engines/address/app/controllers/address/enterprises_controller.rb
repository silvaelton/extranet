require_dependency 'address/application_controller'

module Address
  class EnterprisesController < ApplicationController
    before_action :set_enterprises
    before_action :set_enterprise, only: %i[edit update destroy show link_enterprise]

    has_scope :by_name
    has_scope :by_edital
    has_scope :by_process
    has_scope :by_status
    has_scope :by_company

    def index; end

    def new
      @enterprise = Address::Enterprise.new
    end

    def create
      @enterprise = Address::Enterprise.new(set_params)
      @enterprise.save
    end

    def edit; end

    def update
      @enterprise.update(set_params)
    end

    def destroy
      @enterprise.destroy
    end

    def show; end

    private

    def set_params
      params.require(:enterprise).permit(:name, :value, :company_id, :number_document,
                                         :entity_id, :entity, :status, :web_url,
                                         :number_assessment, :manifestation_allow, :city_id,
                                         :lat, :lng)
    end

    def set_enterprises
      @pagy, @enterprises = pagy(apply_scopes(Address::Enterprise.all))
    end

    def set_enterprise
      @enterprise = Address::Enterprise.find(params[:id])
    end
  end
end
