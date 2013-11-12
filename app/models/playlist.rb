class Playlist < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :songs, dependent: :nullify
end
