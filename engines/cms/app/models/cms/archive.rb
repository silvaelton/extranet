require_dependency "support/cms/archive"

module Cms
  class Archive < Support::Cms::Archive

    validates :name, presence: true
    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }

    mount_uploader :archive, Support::DocumentUploader
  end
end