class Location
  include Mongoid::Document
  include Geocoder::Model::Mongoid  

  belongs_to :trip
  belongs_to :user

  field :address
  field :coordinates, type: Array
  
  geocoded_by :address 
  after_validation :geocode
end
