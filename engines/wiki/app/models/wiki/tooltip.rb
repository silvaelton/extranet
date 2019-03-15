require_dependency "support/wiki/tooltip"

module Wiki
  class Tooltip < Support::Wiki::Tooltip
    belongs_to :category, class_name: 'Wiki::TooltipCategory'

    validates :title, :content, :category_id, presence: true

  end
end