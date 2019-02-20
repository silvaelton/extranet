module Sefaz
  class GenerateXmlService
    def initialize(exemption)
      @exemption = exemption
    end

    def send_xml
      xml = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') { |xml|
        xml.ArrayofImovelConstruido do
          new_exemption.each do |exemption|
            xml.imovelConstruido(id: @exemption.id ) do
              xml.nomeTransmitente @exemption.allotment.notifier.name
              xml.cnpj  @exemption.allotment.notifier.cnpj.gsub('.','').gsub('-','').gsub('/','')
              xml.nomeAdquirente @exemption.name
              xml.cpfAdquirente @exemption.cpf.gsub('.','').gsub('-','')
              xml.enderecoCompleto @exemption.address
              xml.inscricaoImovel @exemption.realty_number
              xml.tipoTransacao @exemption.allotment.exemption_type_id
              xml.valorPactuado @exemption.realty_value
            end
          end
          xml.Signature(xmlns:"http://www.w3.org/2000/09/xmldsig#" ) do
            xml.SignedInfo do
              xml.CanonicalizationMethod(Algorithm: "http://www.w3.org/TR/2001/REC-xml-c14n-20010315")
              xml.SignatureMethod(Algorithm:"http://www.w3.org/2000/09/xmldsig#rsa-sha1")
              xml.Reference(URI: "") do
               xml.Transforms do
                 xml.Transform(Algorithm:"http://www.w3.org/2000/09/xmldsig#enveloped-signature")
                 xml.Transform(Algorithm:"http://www.w3.org/TR/2001/REC-xml-c14n-20010315")
               end
               xml.DigestMethod(Algorithm:"http://www.w3.org/2000/09/xmldsig#sha1")
               xml.DigestValue "F/H4EiKpUNLHNLL0qKP3MnG+kQI="
              end
            end
            xml.SignatureValue "rdevDsyExNknpYJ6u2G3a6CTVJTCZQzIfhBQsVGXFb6KJb8bLnqsWBikVjUDNoE6w3kgkSdorVH2Vb4+LFStWzXiLX4dJnN6yHVFmfdDYtA9ZMsmWK8Skm+77P0gxFkwONrzbbAFeFVyGK1IGum999lfSRNiXCNK8bXc0dFpYLoBMXJsNAURjZvDLeNCveur7PCxDqsPevcnN4zj0VVFJxAzg+7SsgvKqhxzrLJH/6kqK2DBpbzMi6AvgeRsNjBnwliyvl21CoPzarpZT1edFrp65snHtx8Rw8UfBowxiVg8D/X02AgOF/CDBlQ3gPH7Fv4pKi5D6dDuQwyvXgO9dQ=="
            xml.KeyInfo do
              xml.X509Data do
                xml.X509Certificate      "MIIIMTCCBhmgAwIBAgIQAwRlgz3rhkBbSgy/IeEj2jANBgkqhkiG9w0BAQsFADB4MQswCQYDVQQGEwJCUjETMBEGA1UEChMKSUNQLUJyYXNpbDE2MDQGA1UECxMtU2VjcmV0YXJpYSBkYSBSZWNlaXRhIEZlZGVyYWwgZG8gQnJhc2lsIC0gUkZCMRwwGgYDVQQDExNBQyBDZXJ0aXNpZ24gUkZCIEc1MB4XDTE4MDMyOTE0MTYwNloXDTIxMDMyODE0MTYwNlowggEIMQswCQYDVQQGEwJCUjETMBEGA1UECgwKSUNQLUJyYXNpbDELMAkGA1UECAwCREYxETAPBgNVBAcMCEJyYXNpbGlhMTYwNAYDVQQLDC1TZWNyZXRhcmlhIGRhIFJlY2VpdGEgRmVkZXJhbCBkbyBCcmFzaWwgLSBSRkIxFjAUBgNVBAsMDVJGQiBlLUNOUEogQTMxKTAnBgNVBAsMIEF1dGVu     dGljYWRvIHBvciBBUiBGZWNvbWVyY2lvIERGMUkwRwYDVQQDDEBDT01QQU5ISUEgREUgREVTRU5WT0xWSU1FTlRPIEhBQklUQUNJT05BTCBETyBESVNUOjA5MzM1NTc1MDAwMTMwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5UN/n6qi/YROnjK/PrzTRrYQsDP8dARkW6GyCNColwAUxEKrvuHyOhYr3ZSwJfqRCXH/tGJ743q4A7/6swk7Cprc25UpdbZJNd1CB8HQQrYC1KSEodLZl/EbUrXiTTS1gqDRa7WXluZzqvyOtkU2aLqpRIkPzNh5xfHM0HvI8ULIvEq5+35SDFnLpSjJChwyaAqFoCmfLxp4PHlD0Ued8R1+GGltOqe6Dq9ZuD0XW6r+o4tYG43UOj7jA8ruKwb+Nt36VtrW5dvlyu25a39HCEgw0CUoI491FWm9D8oOlP66fbY3PS9eU     qo94JNkPfUTe/7Ka7p4kPKRjIpWYHbDhQIDAQABo4IDIzCCAx8wgdIGA1UdEQSByjCBx6A9BgVgTAEDBKA0BDIyODA0MTk1NTExOTc4ODU2MTcyMDAwMDAwMDAwMDAwMDAwMDAwMDAzMDU3NzZTU1BERqAwBgVgTAEDAqAnBCVHSUxTT04gSk9TRSBQQVJBTkhPUyBERSBQQVVMQSBFIFNJTFZBoBkGBWBMAQMDoBAEDjA5MzM1NTc1MDAwMTMwoBcGBWBMAQMHoA4EDDAwMDAwMDAwMDAwMIEgZ2VvdmFuZS5tYXJ0aW5zQGNvZGhhYi5kZi5nb3YuYnIwCQYDVR0TBAIwADAfBgNVHSMEGDAWgBRTfX+dvtFh0CC62p/jiacTc1jNQjB/BgNVHSAEeDB2MHQGBmBMAQIDBjBqMGgGCCsGAQUFBwIBFlxodHRwOi8vaWNwLWJyYXNpbC5jZXJ0aXNpZ24uY29tLmJyL3     JlcG9zaXRvcmlvL2RwYy9BQ19DZXJ0aXNpZ25fUkZCL0RQQ19BQ19DZXJ0aXNpZ25fUkZCLnBkZjCBvAYDVR0fBIG0MIGxMFegVaBThlFodHRwOi8vaWNwLWJyYXNpbC5jZXJ0aXNpZ24uY29tLmJyL3JlcG9zaXRvcmlvL2xjci9BQ0NlcnRpc2lnblJGQkc1L0xhdGVzdENSTC5jcmwwVqBUoFKGUGh0dHA6Ly9pY3AtYnJhc2lsLm91dHJhbGNyLmNvbS5ici9yZXBvc2l0b3Jpby9sY3IvQUNDZXJ0aXNpZ25SRkJHNS9MYXRlc3RDUkwuY3JsMA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgawGCCsGAQUFBwEBBIGfMIGcMF8GCCsGAQUFBzAChlNodHRwOi8vaWNwLWJyYXNpbC5jZXJ0aXNpZ24uY29tLmJyL3JlcG9     zaXRvcmlvL2NlcnRpZmljYWRvcy9BQ19DZXJ0aXNpZ25fUkZCX0c1LnA3YzA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AtYWMtY2VydGlzaWduLXJmYi5jZXJ0aXNpZ24uY29tLmJyMA0GCSqGSIb3DQEBCwUAA4ICAQADNv0Qp3edsYdH15h7TcnzCPQ/Tqa3bmsMYhP3BTySoJU8r2h6TujsZfd7XAfKsi/7BpRrIczrmOx7WZqpz5EZBfsY4gagPfuX0xaksGl/do228va/gmjLyyEOxj4a2DqzAUaY1F25putlde+egl5f5T/ZyAB7ZO+YVBbvRjz3o3LB0VKK/41IDK4hwXxgp5dLyon7AChhirchsb56t33v/Tsjf2Rk6XNYITp8R0kcmaFcpijto/NCN7H1xRLyle2iQEXsuqSecHUccAUO93Vv0sRehY5f20ICUxssC8D6DuHTHMKmb1S1z/AlvxQeO8aPO6b0     sjl+pcyhJnlKoVfd3+Oy4HnnS7DyU5pK4qoMOtUSJXeQ/p7JLgCilA57NRSurjpt3vS5OAIQyi/RpCeJvs6wor2N6xjbUuJ0J1DmtdQbTp0J/pqEKPiezKp6QzAg6xuexeaUo6xkN12fPLJfWUDsAdcLTLOrJinpcsmdBgAr/mOiP2fKLLx3cOw/uPzCo84Y7ykaJkftRwsXgwPWcSKUCVmeiqOqeY4Nj7rsi0GQsWi3lzut/kUoXtkzl9X4kgdb+c8PJGxcbWSIEUXucwCo1dOGgBp7i6nGI5mDX6zaNEga97uyRHevnWGtXbgfcAP8q70bZjsQL33ZbhNboDGo95mOjWIOQXVPvg45Pg=="
              end
            end
          end
        end
        }.to_xml
    end

    def xml_parcial
      xml = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') { |xml|
        xml.ArrayofCancelamentoParcial do
          new_exemption.each do |exemption|
            xml.cancelamentoParcial do
              xml.nomeTransmitente @exemption.allotment.notifier.name
              xml.cnpj  @exemption.allotment.notifier.cnpj.gsub('.','').gsub('-','').gsub('/','')
              xml.cpfAdquirente @exemption.cpf.gsub('.','').gsub('-','')
              xml.inscricaoImovel @exemption.realty_number
              xml.tipoTransacao @exemption.allotment.exemption_type == "ITBI" ? 1 : 2
              xml.anoAto @exemption.year_act
              xml.atoGerado @exemption.number_act_to_cancel
              xml.justificativa @exemption.allotment.observation
            end
          end
          xml.Signature(xmlns:"http://www.w3.org/2000/09/xmldsig#" ) do
            xml.SignedInfo do
              xml.CanonicalizationMethod(Algorithm: "http://www.w3.org/TR/2001/REC-xml-c14n-20010315")
              xml.SignatureMethod(Algorithm:"http://www.w3.org/2000/09/xmldsig#rsa-sha1")
              xml.Reference(URI: "") do
               xml.Transforms do
                 xml.Transform(Algorithm:"http://www.w3.org/2000/09/xmldsig#enveloped-signature")
                 xml.Transform(Algorithm:"http://www.w3.org/TR/2001/REC-xml-c14n-20010315")
               end
               xml.DigestMethod(Algorithm:"http://www.w3.org/2000/09/xmldsig#sha1")
               xml.DigestValue "F/H4EiKpUNLHNLL0qKP3MnG+kQI="
              end
            end
            xml.SignatureValue "rdevDsyExNknpYJ6u2G3a6CTVJTCZQzIfhBQsVGXFb6KJb8bLnqsWBikVjUDNoE6w3kgkSdorVH2Vb4+LFStWzXiLX4dJnN6yHVFmfdDYtA9ZMsmWK8Skm+77P0gxFkwONrzbbAFeFVyGK1IGum999lfSRNiXCNK8bXc0dFpYLoBMXJsNAURjZvDLeNCveur7PCxDqsPevcnN4zj0VVFJxAzg+7SsgvKqhxzrLJH/6kqK2DBpbzMi6AvgeRsNjBnwliyvl21CoPzarpZT1edFrp65snHtx8Rw8UfBowxiVg8D/X02AgOF/CDBlQ3gPH7Fv4pKi5D6dDuQwyvXgO9dQ=="
            xml.KeyInfo do
              xml.X509Data do
                xml.X509Certificate     "MIIIMTCCBhmgAwIBAgIQAwRlgz3rhkBbSgy/IeEj2jANBgkqhkiG9w0BAQsFADB4MQswCQYDVQQGEwJCUjETMBEGA1UEChMKSUNQLUJyYXNpbDE2MDQGA1UECxMtU2VjcmV0YXJpYSBkYSBSZWNlaXRhIEZlZGVyYWwgZG8gQnJhc2lsIC0gUkZCMRwwGgYDVQQDExNBQyBDZXJ0aXNpZ24gUkZCIEc1MB4XDTE4MDMyOTE0MTYwNloXDTIxMDMyODE0MTYwNlowggEIMQswCQYDVQQGEwJCUjETMBEGA1UECgwKSUNQLUJyYXNpbDELMAkGA1UECAwCREYxETAPBgNVBAcMCEJyYXNpbGlhMTYwNAYDVQQLDC1TZWNyZXRhcmlhIGRhIFJlY2VpdGEgRmVkZXJhbCBkbyBCcmFzaWwgLSBSRkIxFjAUBgNVBAsMDVJGQiBlLUNOUEogQTMxKTAnBgNVBAsMIEF1dGV    udGljYWRvIHBvciBBUiBGZWNvbWVyY2lvIERGMUkwRwYDVQQDDEBDT01QQU5ISUEgREUgREVTRU5WT0xWSU1FTlRPIEhBQklUQUNJT05BTCBETyBESVNUOjA5MzM1NTc1MDAwMTMwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5UN/n6qi/YROnjK/PrzTRrYQsDP8dARkW6GyCNColwAUxEKrvuHyOhYr3ZSwJfqRCXH/tGJ743q4A7/6swk7Cprc25UpdbZJNd1CB8HQQrYC1KSEodLZl/EbUrXiTTS1gqDRa7WXluZzqvyOtkU2aLqpRIkPzNh5xfHM0HvI8ULIvEq5+35SDFnLpSjJChwyaAqFoCmfLxp4PHlD0Ued8R1+GGltOqe6Dq9ZuD0XW6r+o4tYG43UOj7jA8ruKwb+Nt36VtrW5dvlyu25a39HCEgw0CUoI491FWm9D8oOlP66fbY3PS9    eUqo94JNkPfUTe/7Ka7p4kPKRjIpWYHbDhQIDAQABo4IDIzCCAx8wgdIGA1UdEQSByjCBx6A9BgVgTAEDBKA0BDIyODA0MTk1NTExOTc4ODU2MTcyMDAwMDAwMDAwMDAwMDAwMDAwMDAzMDU3NzZTU1BERqAwBgVgTAEDAqAnBCVHSUxTT04gSk9TRSBQQVJBTkhPUyBERSBQQVVMQSBFIFNJTFZBoBkGBWBMAQMDoBAEDjA5MzM1NTc1MDAwMTMwoBcGBWBMAQMHoA4EDDAwMDAwMDAwMDAwMIEgZ2VvdmFuZS5tYXJ0aW5zQGNvZGhhYi5kZi5nb3YuYnIwCQYDVR0TBAIwADAfBgNVHSMEGDAWgBRTfX+dvtFh0CC62p/jiacTc1jNQjB/BgNVHSAEeDB2MHQGBmBMAQIDBjBqMGgGCCsGAQUFBwIBFlxodHRwOi8vaWNwLWJyYXNpbC5jZXJ0aXNpZ24uY29tLmJ    yL3JlcG9zaXRvcmlvL2RwYy9BQ19DZXJ0aXNpZ25fUkZCL0RQQ19BQ19DZXJ0aXNpZ25fUkZCLnBkZjCBvAYDVR0fBIG0MIGxMFegVaBThlFodHRwOi8vaWNwLWJyYXNpbC5jZXJ0aXNpZ24uY29tLmJyL3JlcG9zaXRvcmlvL2xjci9BQ0NlcnRpc2lnblJGQkc1L0xhdGVzdENSTC5jcmwwVqBUoFKGUGh0dHA6Ly9pY3AtYnJhc2lsLm91dHJhbGNyLmNvbS5ici9yZXBvc2l0b3Jpby9sY3IvQUNDZXJ0aXNpZ25SRkJHNS9MYXRlc3RDUkwuY3JsMA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgawGCCsGAQUFBwEBBIGfMIGcMF8GCCsGAQUFBzAChlNodHRwOi8vaWNwLWJyYXNpbC5jZXJ0aXNpZ24uY29tLmJyL3J    lcG9zaXRvcmlvL2NlcnRpZmljYWRvcy9BQ19DZXJ0aXNpZ25fUkZCX0c1LnA3YzA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AtYWMtY2VydGlzaWduLXJmYi5jZXJ0aXNpZ24uY29tLmJyMA0GCSqGSIb3DQEBCwUAA4ICAQADNv0Qp3edsYdH15h7TcnzCPQ/Tqa3bmsMYhP3BTySoJU8r2h6TujsZfd7XAfKsi/7BpRrIczrmOx7WZqpz5EZBfsY4gagPfuX0xaksGl/do228va/gmjLyyEOxj4a2DqzAUaY1F25putlde+egl5f5T/ZyAB7ZO+YVBbvRjz3o3LB0VKK/41IDK4hwXxgp5dLyon7AChhirchsb56t33v/Tsjf2Rk6XNYITp8R0kcmaFcpijto/NCN7H1xRLyle2iQEXsuqSecHUccAUO93Vv0sRehY5f20ICUxssC8D6DuHTHMKmb1S1z/AlvxQeO8a    PO6b0sjl+pcyhJnlKoVfd3+Oy4HnnS7DyU5pK4qoMOtUSJXeQ/p7JLgCilA57NRSurjpt3vS5OAIQyi/RpCeJvs6wor2N6xjbUuJ0J1DmtdQbTp0J/pqEKPiezKp6QzAg6xuexeaUo6xkN12fPLJfWUDsAdcLTLOrJinpcsmdBgAr/mOiP2fKLLx3cOw/uPzCo84Y7ykaJkftRwsXgwPWcSKUCVmeiqOqeY4Nj7rsi0GQsWi3lzut/kUoXtkzl9X4kgdb+c8PJGxcbWSIEUXucwCo1dOGgBp7i6nGI5mDX6zaNEga97uyRHevnWGtXbgfcAP8q70bZjsQL33ZbhNboDGo95mOjWIOQXVPvg45Pg=="
              end
            end
          end
        end
        }.to_xml
    end


    def xml_total
     xml = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') { |xml|
       xml.ArrayofCancelamentoTotal do
         new_exemption.each do |exemption|
           xml.cancelamentoTotal do
             xml.nomeTransmitente @exemption.allotment.notifiers
             xml.cnpj  @exemption.allotment.cnpj_notifiers.gsub('.','').gsub('-','').gsub('/','')
             xml.atoGerado @exemption.number_act_to_cancel
             xml.anoAto @exemption.year_act
             xml.justificativa @exemption.allotment.observation
          end
        end
         xml.Signature(xmlns:"http://www.w3.org/2000/09/xmldsig#" ) do
           xml.SignedInfo do
             xml.CanonicalizationMethod(Algorithm: "http://www.w3.org/TR/2001/REC-xml-c14n-20010315")
             xml.SignatureMethod(Algorithm:"http://www.w3.org/2000/09/xmldsig#rsa-sha1")
             xml.Reference(URI: "") do
              xml.Transforms do
                xml.Transform(Algorithm:"http://www.w3.org/2000/09/xmldsig#enveloped-signature")
                xml.Transform(Algorithm:"http://www.w3.org/TR/2001/REC-xml-c14n-20010315")
              end
              xml.DigestMethod(Algorithm:"http://www.w3.org/2000/09/xmldsig#sha1")
              xml.DigestValue "F/H4EiKpUNLHNLL0qKP3MnG+kQI="
             end
           end
           xml.SignatureValue "rdevDsyExNknpYJ6u2G3a6CTVJTCZQzIfhBQsVGXFb6KJb8bLnqsWBikVjUDNoE6w3kgkSdorVH2Vb4+LFStWzXiLX4dJnN6yHVFmfdDYtA9ZMsmWK8Skm+77P0gxFkwONrzbbAFeFVyGK1IGum999lfSRNiXCNK8bXc0dFpYLoBMXJsNAURjZvDLeNCveur7PCxDqsPevcnN4zj0VVFJxAzg+7SsgvKqhxzrLJH/6kqK2DBpbzMi6AvgeRsNjBnwliyvl21CoPzarpZT1edFrp65snHtx8Rw8UfBowxiVg8D/X02AgOF/CDBlQ3gPH7Fv4pKi5D6dDuQwyvXgO9dQ=="
           xml.KeyInfo do
             xml.X509Data do
               xml.X509Certificate   "MIIIMTCCBhmgAwIBAgIQAwRlgz3rhkBbSgy/IeEj2jANBgkqhkiG9w0BAQsFADB4MQswCQYDVQQGEwJCUjETMBEGA1UEChMKSUNQLUJyYXNpbDE2MDQGA1UECxMtU2VjcmV0YXJpYSBkYSBSZWNlaXRhIEZlZGVyYWwgZG8gQnJhc2lsIC0gUkZCMRwwGgYDVQQDExNBQyBDZXJ0aXNpZ24gUkZCIEc1MB4XDTE4MDMyOTE0MTYwNloXDTIxMDMyODE0MTYwNlowggEIMQswCQYDVQQGEwJCUjETMBEGA1UECgwKSUNQLUJyYXNpbDELMAkGA1UECAwCREYxETAPBgNVBAcMCEJyYXNpbGlhMTYwNAYDVQQLDC1TZWNyZXRhcmlhIGRhIFJlY2VpdGEgRmVkZXJhbCBkbyBCcmFzaWwgLSBSRkIxFjAUBgNVBAsMDVJGQiBlLUNOUEogQTMxKTAnBgNVBAsMIEF1dG  VudGljYWRvIHBvciBBUiBGZWNvbWVyY2lvIERGMUkwRwYDVQQDDEBDT01QQU5ISUEgREUgREVTRU5WT0xWSU1FTlRPIEhBQklUQUNJT05BTCBETyBESVNUOjA5MzM1NTc1MDAwMTMwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5UN/n6qi/YROnjK/PrzTRrYQsDP8dARkW6GyCNColwAUxEKrvuHyOhYr3ZSwJfqRCXH/tGJ743q4A7/6swk7Cprc25UpdbZJNd1CB8HQQrYC1KSEodLZl/EbUrXiTTS1gqDRa7WXluZzqvyOtkU2aLqpRIkPzNh5xfHM0HvI8ULIvEq5+35SDFnLpSjJChwyaAqFoCmfLxp4PHlD0Ued8R1+GGltOqe6Dq9ZuD0XW6r+o4tYG43UOj7jA8ruKwb+Nt36VtrW5dvlyu25a39HCEgw0CUoI491FWm9D8oOlP66fbY3P  S9eUqo94JNkPfUTe/7Ka7p4kPKRjIpWYHbDhQIDAQABo4IDIzCCAx8wgdIGA1UdEQSByjCBx6A9BgVgTAEDBKA0BDIyODA0MTk1NTExOTc4ODU2MTcyMDAwMDAwMDAwMDAwMDAwMDAwMDAzMDU3NzZTU1BERqAwBgVgTAEDAqAnBCVHSUxTT04gSk9TRSBQQVJBTkhPUyBERSBQQVVMQSBFIFNJTFZBoBkGBWBMAQMDoBAEDjA5MzM1NTc1MDAwMTMwoBcGBWBMAQMHoA4EDDAwMDAwMDAwMDAwMIEgZ2VvdmFuZS5tYXJ0aW5zQGNvZGhhYi5kZi5nb3YuYnIwCQYDVR0TBAIwADAfBgNVHSMEGDAWgBRTfX+dvtFh0CC62p/jiacTc1jNQjB/BgNVHSAEeDB2MHQGBmBMAQIDBjBqMGgGCCsGAQUFBwIBFlxodHRwOi8vaWNwLWJyYXNpbC5jZXJ0aXNpZ24uY29t  LmJyL3JlcG9zaXRvcmlvL2RwYy9BQ19DZXJ0aXNpZ25fUkZCL0RQQ19BQ19DZXJ0aXNpZ25fUkZCLnBkZjCBvAYDVR0fBIG0MIGxMFegVaBThlFodHRwOi8vaWNwLWJyYXNpbC5jZXJ0aXNpZ24uY29tLmJyL3JlcG9zaXRvcmlvL2xjci9BQ0NlcnRpc2lnblJGQkc1L0xhdGVzdENSTC5jcmwwVqBUoFKGUGh0dHA6Ly9pY3AtYnJhc2lsLm91dHJhbGNyLmNvbS5ici9yZXBvc2l0b3Jpby9sY3IvQUNDZXJ0aXNpZ25SRkJHNS9MYXRlc3RDUkwuY3JsMA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgawGCCsGAQUFBwEBBIGfMIGcMF8GCCsGAQUFBzAChlNodHRwOi8vaWNwLWJyYXNpbC5jZXJ0aXNpZ24uY29tLmJ  yL3JlcG9zaXRvcmlvL2NlcnRpZmljYWRvcy9BQ19DZXJ0aXNpZ25fUkZCX0c1LnA3YzA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AtYWMtY2VydGlzaWduLXJmYi5jZXJ0aXNpZ24uY29tLmJyMA0GCSqGSIb3DQEBCwUAA4ICAQADNv0Qp3edsYdH15h7TcnzCPQ/Tqa3bmsMYhP3BTySoJU8r2h6TujsZfd7XAfKsi/7BpRrIczrmOx7WZqpz5EZBfsY4gagPfuX0xaksGl/do228va/gmjLyyEOxj4a2DqzAUaY1F25putlde+egl5f5T/ZyAB7ZO+YVBbvRjz3o3LB0VKK/41IDK4hwXxgp5dLyon7AChhirchsb56t33v/Tsjf2Rk6XNYITp8R0kcmaFcpijto/NCN7H1xRLyle2iQEXsuqSecHUccAUO93Vv0sRehY5f20ICUxssC8D6DuHTHMKmb1S1z/Alvx  QeO8aPO6b0sjl+pcyhJnlKoVfd3+Oy4HnnS7DyU5pK4qoMOtUSJXeQ/p7JLgCilA57NRSurjpt3vS5OAIQyi/RpCeJvs6wor2N6xjbUuJ0J1DmtdQbTp0J/pqEKPiezKp6QzAg6xuexeaUo6xkN12fPLJfWUDsAdcLTLOrJinpcsmdBgAr/mOiP2fKLLx3cOw/uPzCo84Y7ykaJkftRwsXgwPWcSKUCVmeiqOqeY4Nj7rsi0GQsWi3lzut/kUoXtkzl9X4kgdb+c8PJGxcbWSIEUXucwCo1dOGgBp7i6nGI5mDX6zaNEga97uyRHevnWGtXbgfcAP8q70bZjsQL33ZbhNboDGo95mOjWIOQXVPvg45Pg=="
             end
           end
         end
       end
       }.to_xml
     end
  end
end
