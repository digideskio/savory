class Rating
  include Mongoid::Document

  field :camis, type: Integer
  field :dba, type: String
  field :boro, type: String
  field :building, type: Integer
  field :street, type: String
  field :zipcode, type: Integer
  field :phone, type: String
  field :cuisine_description, type: String
  field :inspection_date, type: Date
  field :action, type: String
  field :violation_code, type: String
  field :violation_description, type: String
  field :critical_flag, type: String
  field :score, type: Integer
  field :grade, type: String
  field :grade_date, type: Date
  field :record_date, type: Date
  field :inspection_type, type: String
end