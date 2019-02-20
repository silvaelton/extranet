require_dependency 'support/juridical/instancy'

module Juridical
  class Instancy < Support::Juridical::Instancy
    has_many :instancy_places

    validates :name, presence: true
  end
end
