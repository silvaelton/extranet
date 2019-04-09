require_dependency 'support/attendance/requeriment_attachment'

module Attendance
  class RequerimentAttachment < Support::Attendance::RequerimentAttachment

    mount_uploader :attachment, Support::Attendance::RequerimentUploader
  end
end