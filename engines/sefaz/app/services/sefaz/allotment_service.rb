module Sefaz
  class AllotmentService
    def initialize(allotment)
      @allotment = allotment
    end

    # Consula o protocolo da sefaz e caso exista retorno, atualiza base de dados.
    def protocol_search
      set_client
      message = { "num_protocolo"  => @allotment.protocol_return.to_s }

      @response = @client.call(:consulta_protocolo, message: message )

      process = @response.hash[:envelope][:body][:consulta_protocolo_response][:consulta_protocolo_result][:ok]

      if process
        result = @response.hash[:envelope][:body][:consulta_protocolo_response][:consulta_protocolo_result][:detalhe_protocolo_][:detalhe_protocolo]
        if result.count == 5
          begin
            cpf = result[:cpf_adquirente] if result[:cpf_adquirente].present?
            @candidate = @allotment.exemptions.find_by_cpf(cpf) rescue nil

             if @candidate.present?
               @candidate.act_number = result[:num_ato_declaratorio]
               @candidate.return_message = result[:msg_ret]
               @candidate.save
             end
           rescue
             result.each do |r|
               cpf = r[:cpf_adquirente] if r[:cpf_adquirente].present?
               @candidate = @allotment.exemptions.find_by_cpf(cpf) rescue nil
               if @candidate.present?
                 @candidate.act_number = r[:num_ato_declaratorio]
                 @candidate.return_message = r[:msg_ret]
                 @candidate.save
               end
             end
           end
         else
           result.each do |r|
             cpf = r[:cpf_adquirente] if r[:cpf_adquirente].present?
             @candidate = @allotment.exemptions.find_by_cpf(cpf) rescue nil
             if @candidate.present?
               @candidate.act_number = r[:num_ato_declaratorio]
               @candidate.return_message = r[:msg_ret]
               @candidate.save
             end
           end
         end

        @allotment.update(send_status_id: 4)
        return "ok"
      else
 				return @response.hash[:envelope][:body][:consulta_protocolo_response][:consulta_protocolo_result][:msg_ret]
 			end
    end

    private

    def self.set_client
			@client = Savon.client(wsdl: 'http://publica.agencianet.fazenda.df.gov.br/codhab/ConsessaoImovel.asmx?wsdl', namespace: nil,encoding: "UTF-8", env_namespace: :soap,open_timeout: 900,read_timeout:900)
		end
  end
end
