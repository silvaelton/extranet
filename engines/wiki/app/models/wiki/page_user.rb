require_dependency "support/wiki/page_user"

module Wiki
  class PageUser < Support::Wiki::PageUser
    belongs_to :staff, class_name: 'Pivotal::User'
    belongs_to :topic, class_name: 'Wiki::Topic'

    validates :staff_id, :topic_id, presence: true
    
  end
end