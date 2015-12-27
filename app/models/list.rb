class List
  include Mongoid::Document
  has_many :places, dependent: :destroy
  belongs_to :user

  field :name, type: String
  field :description, type: String

  validates_presence_of :name
end
