require_dependency 'support/address/booking'

module Address
  class Booking < Support::Address::Booking
    validates :cpf, cpf: true, presence: true
    validates :observation, presence: true
  end
end
