class Artist < ActiveRecord::Base
  has_many :songs, dependent: :delete_all
  has_many :genres, through: :songs

  def genre_names
    self.genres.collect do |genre|
      genre.name
    end.join(", ")
  end

  def slug
    self.name.downcase.gsub(/[^a-z ]/,' ').split.join(" ").gsub(/ /, "-")
  end

  def self.find_by_slug(slug)
    Artist.all.find {|s| s.slug == slug}
  end
end
