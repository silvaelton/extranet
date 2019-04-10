require_dependency 'support/pivotal/nav'

module Pivotal
  class Nav < Support::Pivotal::Nav

    validates :position, uniqueness: { scope: :deleted}

    has_many :childrens, class_name: 'Pivotal::Nav', foreign_key: :father_id
    has_many :user_navs
    
  end
end