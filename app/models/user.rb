class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_many :lists, dependent: :destroy
  has_many :places, dependent: :destroy

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :photo_url, type: String
  field :facebook, type: String
  field :twitter, type: String
  field :website, type: String
  field :password_reset_token, type: String
  field :password_reset_sent_at, type: DateTime

  has_secure_password
  validates_presence_of :first_name, :last_name, :email
  validates :email, :uniqueness => true
  validates :password, :length => {
    :minimum => 6,
    :maximum => 20,
    :too_short => "must be at least %{count} characters",
    :too_long => "must be at most %{count} characters"
  }

  def send_password_reset
    self.password_reset_token = SecureRandom.urlsafe_base64
    self.password_reset_sent_at = Time.zone.now
    save!(:validate => false)
    UserMailer.password_reset(self).deliver_now
  end

  def save_password(password)
    self.password = password
    save!(:validate => false)
  end
end
