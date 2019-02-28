require_dependency 'support/pivotal/sector'

module Pivotal
  class Sector < Support::Pivotal::Sector
    belongs_to :father, class_name: 'Pivotal::Sector', foreign_key: :father_id

    validates :name, presence: true

    scope :by_status,     -> (status) { where(status: status) }
    scope :by_father_id,  -> (father) { where(father_id: father) }
  end
end