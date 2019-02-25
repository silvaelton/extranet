module Sefaz
  class ExemptionFile
    include ActiveModel::Model

    attr_accessor :attachment, :user_id, :allotment_id

    validates :attachment, presence: true
    validates :attachment, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :attachment, file_content_type: { allow: ['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/wps-office.xlsx'], message: 'Somente arquivos .xlsx' }
  end
end
