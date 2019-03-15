require_dependency "support/cms/post"

module Cms
  class Post < Support::Cms::Post
    belongs_to :post_category, class_name: 'Cms::PostCategory'

    validates :title, :post_category_id, :content, :slug, presence: true
    scope :by_title,       ->(title) { where("title ilike '%#{title}%'") }
    scope :by_status,     ->(status) { where(status: status) }

    mount_uploader :image, Support::ImageUploader
    mount_uploader :image_slide, Support::ImageUploader
  end
end