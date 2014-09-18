class Trip
  include Mongoid::Document

  belongs_to :user
  has_many :locations, dependent: :destroy

  field :name, type: String
end
