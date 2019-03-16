require_dependency 'support/social/burgh'

module Social
  class Burgh < Support::Social::Burgh
    belongs_to :city, required: false

    validates :name, presence: true, uniqueness: true
  end
end
