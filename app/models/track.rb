class Track < ApplicationRecord
  validates :album_id, presence: true
  validates :bonus, presence: true
  validates :lyrics

  belongs_to :album,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: 'Album'
  
end
