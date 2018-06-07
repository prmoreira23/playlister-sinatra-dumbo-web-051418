class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def genre_names
    self.genres.collect do |genre|
      genre.name
    end.join(", ")
  end
end
