require_dependency "address/application_controller"

module Address
  class EnterpriseCompanyUsersController < ApplicationController
    before_action :enterprise_company
    before_action :set_enterprise_company_users
    before_action :set_enterprise_company_user, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @enterprise_company_user = @enterprise_company.enterprise_company_users.new
    end

    def create
      @enterprise_company_user = @enterprise_company.enterprise_company_users.new(set_params)
      @enterprise_company_user.save
    end

    def edit; end

    def update
      @enterprise_company_user.update(set_params)
    end

    def destroy
      @enterprise_company_user.destroy
    end

    private

    def set_params
      params.require(:enterprise_company_user).permit(:name, :password,:remenber_token_expire_at, 
                                                      :status, :email, :password_expires_at, :administrator, :last_password)
    end
    
    def enterprise_company
      @enterprise_company = Address::EnterpriseCompany.find(params[:enterprise_company_id])
    end

    def set_enterprise_company_users
      @pagy, @enterprise_company_users = pagy(apply_scopes(Address::EnterpriseCompanyUser).all)
    end

    def set_enterprise_company_user
      @enterprise_company_user = @enterprise_company.enterprise_company_users.find(params[:id])
    end

  end
end