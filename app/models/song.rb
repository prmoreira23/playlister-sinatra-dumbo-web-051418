class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres, :dependent => :delete_all

  def genre_names
    self.genres.collect do |genre|
      genre.name
    end.join(", ")
  end

  # def artist=(artist)
  #   a = Artist.find_or_create_by(name: artist[:name])
  #   self.artist = a
  # end
  #
  # def genres=(genres)
  #   genres.each do |genre|
  #     g = Genre.find_or_create_by(name: genre)
  #     self.genres << g
  #   end
  # end

  def slug
    self.title.downcase.gsub(/[^a-z ]/,' ').split.join(" ").gsub(/ /, "-")
  end

  def self.find_by_slug(slug)
    Song.all.find {|s| s.slug == slug}
  end
end
