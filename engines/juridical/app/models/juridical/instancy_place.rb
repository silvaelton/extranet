require_dependency 'support/juridical/instancy_place'

module Juridical
  class InstancyPlace < Support::Juridical::InstancyPlace
    belongs_to :instancy, required: false

    validates :name, presence: true

    default_scope { order('name ASC') }
  end
end
