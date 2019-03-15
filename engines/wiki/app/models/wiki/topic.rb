require_dependency "support/wiki/topic"

module Wiki
  class Topic < Support::Wiki::Topic
    validates :name, presence: true

    has_many :page_users
    has_many :pages

  end
end