class Store < ApplicationRecord
  has_many :ratings
  validates_presence_of :lonlat, :namem, :google_place_id
  validates :google_place_id, uniqueness: true

  scope :within, -> (longitude, latitude, distance_in_lm = 5) {
    where(%{
      ST_Distance(lonlat, 'POINT(%f %f)') < %d
    } % [longitude, latitude, distance_in_lm * 1000])
  }

  def rating_average
    return 0 if self.ratings.empty?
    (self.rating.sum(:value) / self.rating.count).to_i
  end
end
