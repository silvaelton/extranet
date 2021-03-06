require "i18n"

module Brb
  class Remittance < Support::Brb::Remittance

    def generate(date, between = false, date_end = nil)
      date_start = "#{date} 00:00:00"
      date_end   = "#{date} 23:59:59"

      invoice_type = Brb::InvoiceType.find(1)

      invoices = Invoice.where(created_at: date_start..date_end, invoice_type: 1).order('id ASC')
      text   = Array.new

      header = " " * 39
      header[1..3] = "DCB"
      header[4..6] = "001"
      header[7..9] = "075"
      header[10..12] = "208"
      header[13..19] = invoice_type.account
      header[20..27] = Date.today.strftime('%Y%m%d')
      header[28..33] = Date.today.strftime('%H%M%S')
      header[34..39] = (invoices.count + 1).to_s.rjust(6, '0')
      header.slice!(0)


      invoices.each do |i|
        white_space = "-"
        value = sprintf('%.2f', i.value)

        line             = " " * 400

        line[1..2]       = "01"
        line[3..5]       = "208"
        line[6..12]      = i.invoice_type.account
        line[13..26]     = i.cnpj.present? ? i.cnpj.to_s.ljust(14) : i.cpf.to_s.ljust(14)
        line[27..61]     = I18n.transliterate(i.name.strip.mb_chars.upcase.ljust(35))
        line[62..96]     = I18n.transliterate(i.address.strip.mb_chars.ljust(35)).upcase
        line[97..111]    = I18n.transliterate(i.city.strip.mb_chars.ljust(15)).upcase
        line[112..113]   = i.state.acronym.mb_chars.upcase.ljust(2)
        line[114..121]   = i.cep.present? ? i.cep.gsub('-','').ljust(8) : ""
        line[122]       = i.cnpj.present? ? "2" : "1"
        line[123..135]  = "#{i.number_document}".ljust(13)
        line[136]       = "1"
        line[137..144]  = i.created_at.strftime('%d%m%Y')
        line[145..146]  = "21"
        line[147]       = "0"
        line[148]       = "0"
        line[149..150]  = "02"
        line[151..153]  = "070"
        line[154..157]  = "0208"
        line[158..187]  = I18n.transliterate(i.city.mb_chars.ljust(30)).upcase
        line[188..195]  = i.due.strftime('%d%m%Y')
        line[196..209]  = "#{'%014d' % value.to_s.gsub('.','').to_i}"
        line[210..221]  = "#{i.number_our}".ljust(12, ' ')
        line[222..223]  = "00"
        line[224..237]  = "0".ljust(14, '0')
        line[238..251]  = "0".ljust(14, '0')
        line[252..253]  = "00"
        line[254..261]  = "0".ljust(8, '0')
        line[262..275]  = "0".ljust(14, '0')
        line[276..277]  = "13"
        line[278..279]  = "00"
        line[280..281]  = "00"
        line[282..283]  = "00"
        line[284..288]  = "00000"
        line[289..328]  = "CODHAB/GDF".ljust(40)
        line[329..368]  = " ".ljust(40)
        line[369..400]  = " ".ljust(32)

        if line.length != 400
          line = line.rstrip
          line = line.ljust(400)
        end

        line.slice!(0)
        text << line
      end

      new_text = ""
      text.each {|t| new_text += "#{t}\r\n" }


      self.header_content = "#{header}\r\n"
      self.content = new_text

     # Invoice.find(invoices.map(&id)).update_all(remittance: true)
    end
  end
end
