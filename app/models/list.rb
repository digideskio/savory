class List
  include Mongoid::Document
  has_many :places
  belongs_to :user

  field :name, type: String
  field :description, type: String
end
