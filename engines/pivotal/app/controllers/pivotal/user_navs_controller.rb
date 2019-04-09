module Pivotal
  class UserNavsController < ApplicationController
    before_action :set_user
        
    def index
    end
    
    private

    def set_user
      @user = Pivotal::User.find(params[:user_id])
    end

  end
end