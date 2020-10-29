class Store < ApplicationRecord
  has_many :ratings
  validates_presence_of :lonlat, :namem, :google_place_id
  validates :google_place_id, uniqueness: true
end
