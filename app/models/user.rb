class User
  include Mongoid::Document
  field :email, type: String
  field :password_hash, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :location, type: String
  field :bio, type: String
end