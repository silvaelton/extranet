require_dependency "support/cms/nav"

module Cms
  class Nav < Support::Cms::Nav

    belongs_to :category, class_name: 'Cms::NavCategory'

    validates :name, :category_id, presence: true
    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_publish,    ->(publish) { where(publish: publish) }
  end
end