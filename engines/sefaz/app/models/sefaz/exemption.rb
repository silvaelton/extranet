require_dependency 'support/sefaz/exemption'

module Sefaz
  class Exemption < Support::Sefaz::Exemption
    attr_accessor :message_sefaz, :icon_return, :icon_color

    belongs_to :allotment, required: false

    validate :virtual_validate!

    def presenter
      presenter = call_presenter('Sefaz::ExemptionPresenter', self)
      block_given? ? yield(presenter) : presenter
    end

    private

    def virtual_validate!
      self.system_message = ""

      if self.allotment.request_type == 1
        add_message_error("Cidade em branco")   if self.city.to_s.empty?
        add_message_error("Endereço em branco") if self.address.to_s.empty?
        add_message_error("Valor em branco")    if self.realty_value.to_s.empty?
      end
      if self.allotment.request_type != 2
        add_message_error("CPF inválido")       if !ValidatesCpfCnpj::Cpf.valid?(self.cpf.format_cpf)
        add_message_error("Nome em branco")     if self.name.to_s.empty?
        add_message_error("CPF em branco")      if self.cpf.to_s.empty?
        add_message_error("IPTU em branco")     if self.realty_number.to_s.empty?
      end
    end

    def add_message_error(message)
      self.system_message  = "" if self.system_message.nil?
      self.system_message += "#{message};"
    end
  end
end
