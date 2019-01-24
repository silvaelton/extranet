require_dependency 'support/pivotal/nav'

module Pivotal
  class Nav < Support::Pivotal::Nav

    has_many :childrens, class_name: 'Pivotal::Nav', foreign_key: :father_id
  end
end