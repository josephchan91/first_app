class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  scope :no_playlist, -> { where(playlist_id: nil) }

  belongs_to :playlist
end
