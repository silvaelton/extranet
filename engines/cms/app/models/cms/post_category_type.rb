require_dependency "support/cms/post_category_type"

module Cms
  class PostCategoryType < Support::Cms::PostCategoryType

    validates :name, presence: true
    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }
  end
end