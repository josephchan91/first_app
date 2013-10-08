class Playlist < ActiveRecord::Base
  validates :name, presence: true

  has_many :songs, through: :playlists_songs
  accepts_nested_attributes_for :songs
end
