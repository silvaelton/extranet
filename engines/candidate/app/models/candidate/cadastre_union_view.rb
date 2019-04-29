module Candidate
  class CadastreUnionView < Support::View::CadastreUnion
    
    belongs_to :dependent,  class_name: '::Candidate::Dependent', foreign_key: :id
    belongs_to :cadastre,   class_name: '::Candidate::Cadastre',  foreign_key: :id
    belongs_to :inheritor,  class_name: '::Candidate::CadastreInheritor', foreign_key: :id

    scope :by_cpf, -> (value) {
      where(cpf: value.unformat_cpf)
    }

    scope :by_name, -> (value) {
      where("name ilike ?", "%#{value}%")
    }


    def name
      
      if dependent?
        self[:name] = "#{self[:name]} (<b>Titular:</b> #{dependent.cadastre.name.mb_chars.upcase rescue 'Sem informação'})"
      end
      
      if inheritor?
        self[:name] = "#{self[:name]} (<b>Titular:</b> #{inheritor.cadastre.name.mb_chars.upcase rescue 'Sem informação'})"
      end 

      self[:name].mb_chars.upcase.html_safe
    end
    
    def id
      if dependent?
        self[:id] = (dependent.cadastre_id rescue false)
      end
      
      if inheritor?
        self[:id] = (inheritor.cadastre_id rescue false)
      end

      self[:id]
    end 


    def program_name
      cadastre.presenter.current_program_name
    end
    
    def situation_name
      cadastre.presenter.current_situation_name
    end

    def type_row_format
      case type_row
      when 'cadastre'
        'Titular'
      when 'dependent'
        'Dependente'
      when 'inheritor'
        'Herdeiro'
      end
    end

    def dependent?
      (type_row == 'dependent')
    end
    
    def cadastre?
      (type_row == 'cadastre')
    end
    
    def inheritor?
      (type_row == 'inheritor')
    end

  end
end