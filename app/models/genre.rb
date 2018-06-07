class Genre < ActiveRecord::Base
  has_many :song_genres, :dependent => :delete_all
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(/ /, "-")
  end
end
