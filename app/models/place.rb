class Place
  include Mongoid::Document
  belongs_to :list
  belongs_to :user
  
  field :name, type: String
  field :location, type: String
  field :url, type: String

  validates_presence_of :name, :location
end
