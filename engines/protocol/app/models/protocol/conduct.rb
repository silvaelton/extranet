require_dependency 'support/protocol/conduct'

module Protocol
  class Conduct < Support::Protocol::Conduct
    belongs_to :assessment
    belongs_to :allotment
    belongs_to :staff,  class_name: "Pivotal::Staff"
    belongs_to :sector, class_name: "Pivotal::Sector"

    enum conduct_type: ['criado', 'enviado', 'devolvido', 'cancelado', 'recebido','aguardando']
  end
end
