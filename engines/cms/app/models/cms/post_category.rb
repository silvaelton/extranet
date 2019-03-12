require_dependency "support/cms/post_category"

module Cms
  class PostCategory < Support::Cms::PostCategory
    belongs_to :category_type, class_name: 'Cms::PostCategoryType'

    validates :name, :category_type_id, presence: true
    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }
  end
end