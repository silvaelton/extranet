require_dependency 'support/sefaz/request_situation'

module Sefaz
  class RequestSituation < Support::Sefaz::RequestSituation
    validates :name, presence: true, uniqueness: true
  end
end
