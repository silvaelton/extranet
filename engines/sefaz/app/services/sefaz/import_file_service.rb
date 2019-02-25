module Sefaz
  class ImportFileService
    def initialize(exemption_file)
      @exemption_file = exemption_file
    end

    def import_files!
      spreadsheet = Roo::Excelx.new(@exemption_file.attachment.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        exemption_hash = Hash[[header, spreadsheet.row(i)].transpose]

        if exemption_hash.present? && !exemption_hash.any? {|k,v| v.nil? }

          exemption = Sefaz::Exemption.where(cpf: exemption_hash["CPF"])
          exemption_new = Sefaz::Exemption.new
          exemption_new.name                   = exemption_hash["NOME"]

          if exemption_hash["CPF"].to_s.length >= 14
            cpf = exemption_hash["CPF"].gsub('-','').gsub('.','').to_s
          else
            cpf = exemption_hash["CPF"].to_s
          end

          if cpf.length <= 12
            cpf = '%011d' % cpf.to_i
          end
          if cpf.length > 11
            cpf = cpf.to_i
          end

          exemption_new.cpf                    = cpf
          exemption_new.city                   = exemption_hash["CIDADE"]
          exemption_new.address                = exemption_hash["ENDERECO"]
          iptu = exemption_hash["IPTU"]
          exemption_new.realty_number          = iptu.class == Float ? exemption_hash["IPTU"].to_i : exemption_hash["IPTU"]
          exemption_new.realty_value           = exemption_hash["VALOR"]
          exemption_new.year_act_cancel        = exemption_hash["ANO"].present? ? exemption_hash["ANO"]  : nil
          exemption_new.number_act_cancel      = exemption_hash["NUMERO"].present? ? exemption_hash["NUMERO"].to_i : nil
          exemption_new.allotment_id           = @exemption_file.allotment_id
          exemption_new.user_id                = @exemption_file.user_id

          begin
            exemption_new.save!
          rescue Exception => e
            errors.add(:file_path, "Ocorreu um erro ao processar, cpf: #{exemption_new.cpf}, #{e.message}")
          end
        end
      end
    end
  end
end
