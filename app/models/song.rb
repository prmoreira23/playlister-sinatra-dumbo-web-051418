class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  def genre_names
    self.genres.collect do |genre|
      genre.name
    end.join(", ")
  end
end
