module Juridical
  class TjReturn
    include ActiveModel::Model
    attr_accessor :date_action, :progress, :complement, :responsible_lawyer
  end
end
