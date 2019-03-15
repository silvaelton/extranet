require_dependency "support/cms/nav_category_type"

module Cms
  class NavCategoryType < Support::Cms::NavCategoryType
    
    validates :name, presence: true
    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }
  end
end