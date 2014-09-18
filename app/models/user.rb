class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_many :trips
  has_many :locations

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_secure_password
end
