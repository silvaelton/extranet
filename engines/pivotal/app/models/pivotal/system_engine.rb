require_dependency 'support/pivotal/engine'

module Pivotal
  class SystemEngine < Support::Pivotal::Engine
    has_many :engine_permissions, dependent: :destroy
    
    validates :name, :code,  presence: true
  end
end