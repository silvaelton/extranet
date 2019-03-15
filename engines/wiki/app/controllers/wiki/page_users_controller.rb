require_dependency "wiki/application_controller"

module Wiki
  class PageUsersController < ApplicationController
    before_action :set_topic

    def new
      @page_user = @topic.page_users.new
    end

    def create
      @page_user = @topic.page_users.new(set_params)
      @page_user.user_id = current_user.id
      @page_user.save
    end

    def destroy
      @page_user = @topic.page_users.find(params[:id])
      @page_user.destroy
    end

    private

    def set_params
      params.require(:page_user).permit(:topic_id, :staff_id, :user_id)
    end

    def set_topic
      @topic = Wiki::Topic.find(params[:topic_id])
    end

  end
end