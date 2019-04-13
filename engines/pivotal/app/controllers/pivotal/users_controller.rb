require_dependency 'pivotal/application_controller'

module Pivotal
  class UsersController < ApplicationController
    before_action :set_users
    before_action :set_user, only: %i[edit update show inactivate reset_password]

    has_scope :by_name
    has_scope :by_cpf
    has_scope :by_username
    has_scope :by_status
    has_scope :by_sector

    def index; end

    def new
      @user = Pivotal::User.new
    end

    def create
      @user = Pivotal::User.new(set_params)
      @user.save
      Pivotal::UserMailer.user_destroy(@user).deliver_now!
    end

    def show; end

    def edit; end

    def update
      @user.update(set_params)
    end

    def inactivate
      status = @user.status ? false : true
      @user.update(status: status)
      Pivotal::UserMailer.user_destroy(@user).deliver_now! if !status
    end

    def reset_password
      @user.update(password: '12345678')
    end

    private

    def set_params
      params.require(:user).permit(:name, :username, :cpf, :born, :born_uf_id, :gender_id,
                                   :avatar, :branch_line, :curriculum, :email, :private_email,
                                   :status, :administrator, :job_id, :civil_state_id, :birth_place,
                                   :telephone, :celphone, :sector_id, :external, :external_observation)
    end

    def set_user
      @user = Pivotal::User.find(params[:id])
    end

    def set_users
      @users_all = apply_scopes(Pivotal::User.order(:name))
      @pagy, @users = pagy(@users_all)
    end
  end
end
