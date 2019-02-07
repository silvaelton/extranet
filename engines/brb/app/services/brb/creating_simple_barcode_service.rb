module Brb
  class CreatingSimpleBarcodeService

    # => Essas variaveis não fazem sentido algum
    # as mesmas estavam no código C# e não havia um manual para entende-las
    #
    # private const string strIdProducao = "8";
    # private const string strIdSegmento = "5";
    # private const string strIdValorReal = "6";

    CNPJ        = "0344"
    PRODUCAO    = "8";
    SEGMENTO    = "5";
    VALOR_REAL  = "6";

    attr_accessor :block_1, :block_2, :block_3, :block_4
    attr_accessor :block_digit_1, :block_digit_2, :block_digit_3, :block_digit_4
    attr_accessor :value, :sequential, :due

    def initialize(args = {})
      self.value      = args[:value]      ||= 0
      self.due        = args[:due] ||= 0
      self.sequential = args[:sequential] ||= 0

      generate_barcode!
    end

    def due=(value)
      @due = Date.parse(value).strftime("%Y%m%d") rescue '000000'
    end

    def sequential=(value)
      value = "#{'%017d' % value.to_i}"
      @sequential = "#{@due}#{value}"
    end

    def value=(value)
      value   = sprintf('%.2f', value).gsub('.','').to_i
      @value  = "#{'%011d' % value.to_s}"
    end

    # => Returns

    def barcode_without_digit
      "#{PRODUCAO}#{SEGMENTO}#{VALOR_REAL}#{@value}#{CNPJ}#{@sequential}"
    end

    def barcode_with_digit
      block_1 = barcode_without_digit[0..2]
      block_2 = barcode_without_digit[3..42]

      digit = calculate_module_10(barcode_without_digit)

      "#{block_1}#{digit}#{block_2}"
    end

    def barcode_without_format
      "#{@block_1}#{@block_digit_1}#{@block_2}#{@block_digit_2}#{@block_3}#{@block_digit_3}#{@block_4}#{@block_digit_4}"
    end

    def barcode_with_format
      barcode_without_format

      barcode = barcode_without_format
      barcode =~ /(\d{11})\.?(\d{1})\.?(\d{11})\.?(\d{1})\.?(\d{11})\.?(\d{1})\.?(\d{11})\.?(\d{1})/
      barcode = "#{$1}-#{$2} #{$3}-#{$4} #{$5}-#{$6} #{$7}-#{$8}"
    end

    def generate_barcode!

      with_digit = barcode_with_digit

      @block_1 = with_digit[0..10]
      @block_2 = with_digit[11..21]
      @block_3 = with_digit[22..32]
      @block_4 = with_digit[33..43]

      @block_digit_1 = calculate_module_10(@block_1)
      @block_digit_2 = calculate_module_10(@block_2)
      @block_digit_3 = calculate_module_10(@block_3)
      @block_digit_4 = calculate_module_10(@block_4)
    end

    def calculate_module_10 string
      total_string = ""
      total_value  = 0

      string.split(//).each_with_index do |char, index|
        index += 1
        total_string += ((index % 2) != 0) ? (char.to_i * 2).to_s : char
      end

      total_string.split(//).each do |char_int|
        total_value += char_int.to_i
      end

      rest_total_value = total_value % 10

      (rest_total_value != 0) ? 10 - rest_total_value : 0
    end
  end
end
