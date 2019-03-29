require_dependency "address/application_controller"

module Address
  class EnterpriseCompaniesController < ApplicationController
    before_action :set_enterprise_companies
    before_action :set_enterprise_company, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @enterprise_company = Address::EnterpriseCompany.new
    end

    def create
      @enterprise_company = Address::EnterpriseCompany.new(set_params)
      @enterprise_company.user_id = current_user.id
      @enterprise_company.save
    end

    def edit; end

    def update
      @enterprise_company.update(set_params)
    end

    def destroy
      @enterprise_company.destroy
    end

    private

    def set_params
      params.require(:enterprise_company).permit(:fantasy_name, :name, :cnpj, :description, :status,
                                                 :telephone, :email, :address, :city_id, :access_allow,
                                                 :user_id, :state_id)
    end

    def set_enterprise_companies
      @pagy, @enterprise_companies = pagy(apply_scopes(Address::EnterpriseCompany).all)
    end

    def set_enterprise_company
      @enterprise_company = Address::EnterpriseCompany.find(params[:id])
    end

  end
end