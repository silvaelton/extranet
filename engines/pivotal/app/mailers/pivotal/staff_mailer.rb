module Pivotal
  class StaffMailer < ActionMailer::Base
    default from: 'gepes@codhab.df.gov.br'

    def user_create(staff)
      @staff      = staff
      @send       = "suporte.untec@codhab.df.gov.br"

      mail(to: @send, cc: 'protocolo@codhab.df.gov.br', subject: "CODHAB - Cadastro de novo usuário")
    end

    def user_destroy(staff)
      @staff      = staff
      @send       = "suporte.untec@codhab.df.gov.br"

      mail(to: @send, cc: 'protocolo@codhab.df.gov.br', subject: "CODHAB - Desligamento de usuário")
    end
  end
end
