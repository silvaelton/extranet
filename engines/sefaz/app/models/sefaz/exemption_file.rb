module Sefaz
  class ExemptionFile
    include ActiveModel::Model

    attr_accessor :file_path, :user_id, :allotment_id

    validates :file_path, presence: true
    validates :file_path, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :file_path, file_content_type: { allow: ['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/wps-office.xlsx'], message: 'Somente arquivos .xlsx' }
  end
end
