require_dependency 'support/address/unit_image'

module Address
  class UnitImageField < Support::Address::UnitImage
    validates :image, presence: true

  end
end
