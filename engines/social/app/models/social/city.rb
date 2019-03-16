require_dependency 'support/social/city'

module Social
  class City < Support::Social::City
    has_many :burghs

    validates :name, presence: true, uniqueness: true
  end
end
