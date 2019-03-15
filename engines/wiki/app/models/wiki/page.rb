require_dependency "support/wiki/page"

module Wiki
  class Page < Support::Wiki::Page
    belongs_to :topic, class_name: 'Wiki::Topic'

    validates :title, :content, presence: true

  end
end