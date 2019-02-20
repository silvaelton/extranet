module Juridical
  class InformationMailer < ActionMailer::Base
    default from: 'proju@codhab.df.gov.br'

    def open(staff, legal_advice)
      headers['Return-Receipt-To'] = 'meiriane.silva@codhab.df.gov.br'
      headers['Disposition-Notification-To'] = 'meiriane.silva@codhab.df.gov.br'
      headers['X-Confirm-Reading-To'] = 'meiriane.silva@codhab.df.gov.br'

      @staff            = Person::Staff.find(staff)
      @legal_advice     = legal_advice

      mail(to: @staff.email, subject: "CODHAB - Acompanhamento de processo - #{@legal_advice.assessment_number}")
    end

    def open_complement(complement)
      headers['Return-Receipt-To'] = 'meiriane.silva@codhab.df.gov.br'
      headers['Disposition-Notification-To'] = 'meiriane.silva@codhab.df.gov.br'
      headers['X-Confirm-Reading-To'] = 'meiriane.silva@codhab.df.gov.br'

      @staff           = Person::Staff.find(complement.responsible_lawyer_id)
      @complement      = complement

      mail(to: @staff.email, subject: "CODHAB - Acompanhamento de processo")
    end
  end
end
