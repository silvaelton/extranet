module Entity
  class Enterprise

    include ActiveModel::Model

    attr_accessor :enterprise_id, :entity_id 

    validates :enterprise_id, :entity_id,  presence: true

  end
end
