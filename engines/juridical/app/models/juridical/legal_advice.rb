require_dependency 'support/juridical/legal_advice'
require 'bd_money/rails'

module Juridical
  class LegalAdvice < Support::Juridical::LegalAdvice
    attr_accessor :instancy

    belongs_to :lawsuit,            required: false
    belongs_to :instancy_place,     required: false
    belongs_to :document_type,      required: false, class_name: "Protocol::DocumentType"
    #belongs_to :responsible_lawyer, required: false,-> {where(sector_current_id: 5)}, foreign_key: "responsible_lawyer_id", class_name: "Person::Staff"
  #  belongs_to :staff,              required: false, class_name: "Person::Staff"

    enum process_type: ['normal','eletrônico']

    enum probability: ['Selecione','improcedente','procedente']

    has_many :complements
    has_many :complainants
    has_many :defendants

    scope :process,  -> (process) {where(process_number: process)}
    scope :lawyer,  -> (lawyer) {where(responsible_lawyer: lawyer)}
    scope :by_status,  -> (status) {where(status: status)}
    scope :by_suitor,  -> (suitor) {joins(:complainants).where("juridical_complainants.name ilike '%#{suitor}%'")}
    scope :by_agency,  -> (agency) {where("agency ilike '%#{agency}%'")}
    scope :by_lawsuit,  -> (lawsuit) {where(lawsuit_id: lawsuit)}
    scope :adm_process,  -> (adm_process) {where(assessment_number: adm_process)}

    scope :by_year,  -> (year) {where("date_part('year', created_at) = ?", year)}
    scope :by_month,  -> (month) {where("date_part('month', created_at) = ?", month)}
    scope :by_week,  -> (week) {where("to_char(created_at::timestamp, 'W') = ?", week.to_s)}
    scope :by_date,  -> (date) {where("created_at::date = ?", Date.parse(date))}

    money :lawsuit_value, precision: 2
    money :condemnation_value, precision: 2
    money :procedural_costs, precision: 2
    money :judicial_deposit, precision: 2

    validates_presence_of :process_number, :agency, :lawsuit, :instancy_place,  if: :valid_type?

    def lawsuit_value=(value)
      self[:lawsuit_value] = 0 unless value.present?
      self[:lawsuit_value] = value.gsub('.','').gsub(',','.')
    end

    def condemnation_value=(value)
      self[:condemnation_value] = 0 unless value.present?
      self[:condemnation_value] = value.gsub('.','').gsub(',','.')
    end

    def procedural_costs=(value)
      self[:procedural_costs] = 0 unless value.present?
      self[:procedural_costs] = value.gsub('.','').gsub(',','.')
    end

    def judicial_deposit=(value)
      self[:judicial_deposit] = 0 unless value.present?
      self[:judicial_deposit] = value.gsub('.','').gsub(',','.')
    end

    private

    def valid_type?
      self.advice_type_id != 1
    end
  end
end
