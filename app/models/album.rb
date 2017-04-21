class Album < ApplicationRecord
  validates :band_id, presence: true
  validates :live, presence: true

  belongs_to :band,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: 'Band'

  has_many :tracks,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: 'Track'


end
