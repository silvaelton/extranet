require_dependency "support/cms/nav_category"

module Cms
  class NavCategory < Support::Cms::NavCategory
    belongs_to :category_type , class_name: 'Cms::NavCategoryType'

    validates :name, :category_type_id, presence: true
    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }
  end
end