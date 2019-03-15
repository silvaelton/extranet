require_dependency "support/wiki/tooltip_category"

module Wiki
  class TooltipCategory < Support::Wiki::TooltipCategory
    validates :name, presence: true

  end
end