class Trip
  include Mongoid::Document

  belongs_to :user
  has_many :locations, dependent: :destroy

  field :trip_name, type: String
end
