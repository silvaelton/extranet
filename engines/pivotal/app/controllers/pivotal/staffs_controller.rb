require_dependency 'person/application_controller'

module Pivotal
  class StaffsController < ApplicationController
    before_action :set_staffs
    before_action :set_staff, only: %i[edit update destroy]

    def index; end

    def new
      @staff = Person::Staff.new
    end

    def create
      @staff = Person::Staff.new(set_params)
      @staff.save
    end

    def edit; end

    def update
      @staff.update(set_params)
    end

    def destroy
      @staff.destroy
    end

    def reset_password
    end

    def shutdown
      Pivotal::StaffMailer.user_destroy(@staff).deliver_now!
      flash[:danger] = 'Email enviado com sucesso.'
      redirect_to staffs_path
    end

    private

    def set_params
      params.require(:staff).permit(:code, :name, :cpf, :rg, :rg_org, :blood_type, :born,
                                    :born_uf_id, :gender_id, :avatar, :personal, :branch_line,
                                    :curriculum, :email, :private_email, :bio, :start_hour,
                                    :end_hour, :weekend_access, :contract_date, :shutdown_date,
                                    :status, :administrator, :password, :job_id, :terms_use, 
                                    :introduce, :civil_state_id, :birth_place, :contract_type_id,
                                    :address, :address_complement, :burgh, :state_id, :city_id,
                                    :cep, :telephone, :celphone, :ctps_number, :ctps_serial,
                                    :ctps_uf_id, :pis_pasep_number, :pis_pasep_date, 
                                    :electoral_title_number, :electoral_title_zone, :electoral_title_section
                                    :electoral_title_uf_id, :bank_number, :bank_agency_number, 
                                    :bank_account_number, :spouse_name, :education_type_id, :graduation,
                                    :resolution, :resolution_date, 
                                    :sector_current_id, :sector_origin_id, :blocked)
    end

    def set_staffs
      @pagy, @staffs = pagy(apply_scopes(Person::Staff).all.order(:name))
    end
    
    def set_staff
      @staff = Person::Staff.find(params[:id])
    end

  end
end