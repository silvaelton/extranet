module Pivotal
  class Session
    include ActiveModel::Model

    attr_accessor :code, :password, :id
  end
end