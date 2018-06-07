class Artist < ActiveRecord::Base
  has_many :songs, dependent: :delete_all
  has_many :genres, through: :songs

  def genre_names
    self.genres.collect do |genre|
      genre.name
    end.join(", ")
  end

  def slug
    self.name.downcase.gsub(/ /, "-")
  end
end
