require_dependency 'support/sefaz/request_type'

module Sefaz
  class RequestType < Support::Sefaz::RequestType
    validates :name, presence: true, uniqueness: true
  end
end
