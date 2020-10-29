class Store < ApplicationRecord

  validates_presence_of :lonlat, :namem, :google_place_id
  validates :google_place_id, uniqueness: true
end
