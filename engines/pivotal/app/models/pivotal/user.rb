require_dependency 'support/pivotal/user'

module Pivotal
  class User < Support::Pivotal::User
    belongs_to :sector, required: false
    belongs_to :job,    required: false

    has_many :session_logs, -> { where(target_model: 'Pivotal::User') }, class_name: 'Pivotal::LogSession', foreign_key: :target_id
    has_many :user_permissions
    has_many :user_navs

    scope :by_name,     ->(name) {where("name ILIKE ?", "%#{name}%")}
    scope :by_cpf,      ->(cpf) {where(cpf: cpf)}
    scope :by_username, ->(username) {where(username: username)}
    scope :by_status,   ->(status) {where(status: status)}
    scope :by_sector,   ->(sector) {where(sector_id: sector)}

    validates :name, :sector_id, :job_id, :username, presence: true
    validates :cpf, cpf: true, presence: true, on: :create

    def presenter
      call_presenter('Pivotal::UserPresenter', self)
    end
  end
end
