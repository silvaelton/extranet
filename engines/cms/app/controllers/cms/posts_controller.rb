require_dependency "cms/application_controller"

module Cms
  class PostsController < ApplicationController
    before_action :set_posts
    before_action :set_post, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_status

    def index;end

    def show; end

    def new
      @post = Cms::Post.new
    end

    def create
      @post = Cms::Post.new(set_params)
      @post.user_id = current_user.id
      if @post.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @post.update(set_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
    end

    private

    def set_params
      params.require(:post).permit(:title, :content, :description, :image, :external, 
                                   :internal, :image_slide, :slide, :image_header, 
                                   :author_image, :slide_color, :external_content_url, 
                                   :publish_date, :post_author, :publish, :draft, :slug, 
                                   :layout, :iframe, :iframe_url, :user_id, :post_category_id)
    end

    def set_posts
      @pagy, @posts = pagy(apply_scopes(Cms::Post).all)
    end

    def set_post
      @post = Cms::Post.find(params[:id])
    end

  end
end