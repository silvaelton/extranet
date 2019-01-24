module Pivotal
  module NavHelper

    def each_navs
      Pivotal::Nav.where(father_id: nil, status: true)
    end
    
  end
end
