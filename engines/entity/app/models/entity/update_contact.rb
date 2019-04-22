require_dependency "support/entity/cadastre"

module Entity
  class UpdateContact < Support::Entity::Cadastre
    validates :cep, :city_id, :address, :address_complement, presence: true
    validates :telephone, presence: true, numericality: true
    validates :telephone_optional, :cell_phone, numericality: true, allow_blank: true
    validates :email, email: true, presence: true
  end
end