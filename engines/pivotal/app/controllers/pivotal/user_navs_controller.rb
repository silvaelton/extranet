module Pivotal
  class UserNavsController < ApplicationController
    before_action :set_user
    before_action :set_nav
        
    def index
      
    end

    def new
      @user_nav = @user.user_navs.new
      @user_nav.creator_id = current_user.id
      @user_nav.nav_id = params[:nav_id]
      @user_nav.user_id = params[:user_id]
      @user_nav.save
    end

    def destroy
      @user_nav = @user.user_navs.find_by(nav_id: params[:id])
      @user_nav.destroy
    end
    
    private

    def set_params
      params.require(:user_nav).permit(:user_id, :creator_id, :nav_id)
    end

    def set_user
      @user = Pivotal::User.find(params[:user_id])
    end

    def set_nav
      @navs = Pivotal::Nav.where(father_id: nil).order(:position)
    end

    def set_user_navs
      @user_navs = @user.user_navs.find(params[:id])
    end
    

  end
end