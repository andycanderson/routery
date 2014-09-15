class Location
  include Mongoid::Document

  belongs_to :trip
  belongs_to :user

  field :name, type: String
  field :description, type: String
  field :coordinates, type: Array
  
  
end
