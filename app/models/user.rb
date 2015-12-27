class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_many :lists
  has_many :places

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :photo_url, type: String

  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password
  validates :email, :uniqueness => true
  validates :password, :length => {
    :minimum => 6,
    :maximum => 20,
    :too_short => "must be at least %{count} characters",
    :too_long => "must be at most %{count} characters"
  }
end