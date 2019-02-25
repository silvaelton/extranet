require_dependency 'support/application_presenter'

module Sefaz
  class ExemptionPresenter < Support::ApplicationPresenter
    def message_sefaz
      self[:act_number].present? ? self[:act_number] : self[:return_message]
    end

    def icon_return
      self.allotment[:request_situation] != 4 ? "fa fa-check" : "fa fa-exclamation-triangle"
    end

    def icon_color
      self.allotment[:request_situation] != 4 && self[:system_message].present? ? "btn btn-danger btn-sm" : "btn btn-success btn-sm"
    end
  end
end
