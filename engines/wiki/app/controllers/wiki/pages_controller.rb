require_dependency "wiki/application_controller"

module Wiki
  class PagesController < ApplicationController
    before_action :set_topic
    before_action :set_page, only: [:edit, :update, :destroy]
    
    def new
      @page = @topic.pages.new
    end

    def create
      @page = @topic.pages.new(set_params)
      @page.user_id = current_user.id
      @page.save
    end

    def edit; end

    def update
      @page.update(set_params)
    end

    def destroy
      @page.destroy
    end

    private

    def set_params
      params.require(:page).permit(:topic_id, :title, :user_id, :content, :iframe, :iframe_url, :status)
    end

    def set_topic
      @topic = Wiki::Topic.find(params[:topic_id])
    end

    def set_page
      @page = @topic.pages.find(params[:id])
    end

  end
end