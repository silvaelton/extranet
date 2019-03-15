require_dependency "wiki/application_controller"

module Wiki
  class TopicsController < ApplicationController
    before_action :set_topics
    before_action :set_topic, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @topic = Wiki::Topic.new
    end

    def create
      @topic = Wiki::Topic.new(set_params)
      @topic.user_id = current_user.id
      @topic.save
    end

    def edit; end

    def update
      @topic.update(set_params)
    end

    def destroy
      @topic.destroy
    end

    private

    def set_params
      params.require(:topic).permit(:name, :description, :status, :public, :user_id)
    end

    def set_topics
      @pagy, @topics = pagy(apply_scopes(Wiki::Topic).all)
    end

    def set_topic
      @topic = Wiki::Topic.find(params[:id])
    end

  end
end