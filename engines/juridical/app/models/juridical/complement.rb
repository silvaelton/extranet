require_dependency 'support/juridical/complement'

module Juridical
  class Complement < Support::Juridical::Complement
    attr_accessor :instancy

    belongs_to :document_type,        required: false, class_name: "Protocol::DocumentType"
    belongs_to :lawsuit,              required: false
    belongs_to :instancy_place,       required: false

    # sector_id: 5 (Proju)
    belongs_to :responsible_lawyer, -> {where(sector_id: 5)},   required: false, class_name: "Pivotal::User", foreign_key: "responsible_lawyer_id"

    belongs_to :advice_type,          required: false
    belongs_to :complement_father_id, required: false, foreign_key: "id", class_name: "Juridical::Complement"
    belongs_to :legal_advice,         required: false
    belongs_to :user,                 required: false, class_name: "Pivotal::User"

    mount_uploader :attachment, Juridical::AttachmentUploader

    validates :complement ,presence: true

    scope :by_year,        ->(year)        { where("date_part('year', created_at) = ?", year) }
    scope :by_month,       ->(month)       { where("date_part('month', created_at) = ?", month) }
    scope :by_week,        ->(week)        { where("to_char(created_at::timestamp, 'W') = ?", week.to_s) }
    scope :by_responsible, ->(responsible) { where(responsible_lawyer_id: responsible) }
    scope :by_status,      ->(status)      { where(status: status) }
    scope :by_date,        ->(date)        { where("created_at::date = ?", Date.parse(date)) }

    after_save :send_email

    def send_email
      begin
       Juridical::InformationMailer.open_complement(self).deliver_now! if self.responsible_lawyer_id.present?
      rescue
      end
    end
  end
end
