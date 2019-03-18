require_dependency 'support/entity/cadastre_activity'

module Entity
  class CadastreActivity < Support::Entity::CadastreActivity 

     belongs_to :user, class_name: 'Pivotal::User'
     belongs_to :activity_type, class_name: 'Candidate::ActivityType'
  
     validates :activity_type_id, :description, presence: true
  end
end