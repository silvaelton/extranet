module Juridical
  class ReturningTribunalService
    attr_accessor :external_array, :legal_advice, :tj_array, :data_return

    def initialize(legal_advice)
      @legal_advice = legal_advice
    end

    def get_array
      return nil if @legal_advice.advice_type_id == 1

      crawler = get_crawler

      if crawler.present?
        crawler_tj = crawler.delete_if {|x| x.blank?}
        @data = crawler_tj.sort_by { |h| h}.reverse
      end
    end

    private

    def get_crawler

      count   = 1
      url     = nil
      process = @legal_advice.process_number.to_s.gsub('.','').gsub('-','')

      if process.present?

        while count < 15 && url.nil? do

          url = "http://tjdf19.tjdft.jus.br/cgi-bin/tjcgi1?NXTPGM=tjhtml105&SELECAO=1&ORIGEM=INTER&CIRCUN=#{count}&CDNUPROC=#{process}"
          doc =  Nokogiri::HTML(open(url))

          @data_return = []

          doc.xpath('//tr').each_with_index do |link, index|

            @data_return[index] =  []

            link.xpath('td').each_with_index do |a, increment|
              if a.text.present?
                if a.text != "Data" && a.text != "Andamento" && a.text != "Complemento" && a.text != ""
                  @data_return[index][0] = DateTime.parse(a.text) if increment == 0
                  @data_return[index][1] = a.content if increment == 1
                  @data_return[index][2] = a.children.to_s.encode("UTF-8").html_safe if @data_return[index][2]
                end
              end
            end
          end
          count +=1
        end

        @complements = @legal_advice.complements
          if @complements.present?
             index = @data_return.count

             @complements.each do |c|
               @data_return[index] = []
               @data_return[index][0] = c.created_at
               @data_return[index][1] = c.complement
               @data_return[index][3] = c.responsible_lawyer.name rescue nil
               @data_return[index][4] = c.status
               @data_return[index][5] = c.id

              index +=1
            end
          end
        return @data_return
      else
        {}
      end
    end
  end
end
