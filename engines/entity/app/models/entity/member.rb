require_dependency 'support/entity/cadastre_member'

module Entity
  class Member < Support::Entity::CadastreMember 
    
    default_scope -> { where('job_id <> 2 OR job_id is null')}

    belongs_to :rg_uf, class_name: 'Support::Common::State', required: false
    belongs_to :city, class_name: 'Support::Common::City', required: false
    belongs_to :job, class_name: 'Entity::MemberJob', required: false

    validates :name, :job_id, :cpf, presence: true
    mount_uploader :photo, Support::ImageUploader
  end
end