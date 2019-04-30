require_dependency 'support/attendance/requeriment'

module Attendance
  class Requeriment < Support::Attendance::Requeriment
    has_many :requeriment_attachments
    belongs_to :requeriment_category, foreign_key: :category_id
    belongs_to :attendant, class_name: "Pivotal::User", foreign_key: :attendant_id

    scope :by_cpf, -> (value) {where(cpf: value.to_s.unformat_cpf) }
    scope :by_category, -> (value) {where(category_id: value) }
    scope :by_situation, -> (value) {
      
      if eval(value)
        where('attendant_answer is true or cancelled is true')
      else 
        where('attendant_answer is false and cancelled is false')
      end
    }

    validates :attendant_answer_content, presence: true

  end
end