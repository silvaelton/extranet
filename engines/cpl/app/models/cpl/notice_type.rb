require_dependency 'support/cpl/notice_type'

module Cpl
  class NoticeType < Support::Cpl::NoticeType
    validates :name, presence: true
  end
end
