module Brb
  class Return
    include ActiveModel::Model

    attr_accessor :file, :type

    validates :file, presence: true

    def process!

      File.open(self.file.tempfile).each_with_index do |line, index|
        if index != 0

            date = line[299..306]
            date = Date.parse("#{date[0..1]}/#{date[2..3]}/#{date[4..8]}") rescue nil
            code = line[108..109]

            @invoice = Brb::Invoice.find_by(number_our: line[70..81]) rescue nil

            if @invoice.present? && %w(05 06 15 16).include?(code) && date.present?

              @invoice.payment = date
              @invoice.status = 1
              @invoice.bank_return = line
              @invoice.save
            end
        end
      end
    end

    def agreement!
      File.open(self.file.tempfile).each_with_index do |line, index|
        if index != 0
          date = line[21..28]
          date_payment = Date.parse("#{date[0..3]}/#{date[4..5]}/#{date[6..7]}") rescue nil
          barcode = line[56..80]
          credit = line[29..36]
          credit = Date.parse("#{credit[0..3]}/#{credit[4..5]}/#{credit[6..7]}") rescue nil

          @invoice = Brb::Invoice.find_by_number_our(barcode) rescue nil

          if @invoice.present? && date.present?
            @invoice.payment = date_payment
            @invoice.status = 1
            @invoice.bank_return = line
            @invoice.credit = credit
            @invoice.save
          end
        end
      end
    end
  end
end
