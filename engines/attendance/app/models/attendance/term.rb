require_dependency 'support/attendance/term'

module Attendance
  class Term < Support::Attendance::Term
    validates :title, :content, presence: true
  end
end