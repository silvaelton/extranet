require_dependency "support/candidate/cadastre"

module Candidate
  class UpdateContact < Support::Candidate::Cadastre
    validates :cep, :city_id, :address, :address_complement, presence: true
    validates :telephone, presence: true, numericality: true
    validates :telephone_optional, :celphone, numericality: true, allow_blank: true
    validates :email, email: true, presence: true
  end
end