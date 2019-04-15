require_dependency 'support/address/unit_image'

module Address
  class UnitImage < Support::Address::UnitImage

    validates :image, presence: true

    mount_uploader :image, Support::ImageUploader
  end
end
