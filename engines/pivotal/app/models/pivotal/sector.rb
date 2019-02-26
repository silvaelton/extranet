require_dependency 'support/pivotal/sector'

module Pivotal
  class Sector < Support::Pivotal::Sector
    belongs_to :father, class_name: 'Pivotal::Sector', foreign_key: :father_id

    validates :name, presence: true
  end
end