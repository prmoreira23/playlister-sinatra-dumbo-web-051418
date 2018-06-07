require 'pry'
class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  post '/songs' do
    song = params[:song]
    genres = song[:genres]
    title = song[:title]
    artist_name = song[:artist]

    song = Song.new(title: title)
    song.artist = Artist.find_or_create_by(name: artist_name)
    genres.each do |genre|
      song.genres << Genre.find_or_create_by(name: genre)
    end
    song.save
  end


  get '/songs/:id' do
    @song = Song.find_by(id: params[:id])
    erb :"songs/show"
  end

  get "/songs/:id/edit" do
    @song = Song.find_by(id: params[:id])
    @action_url = "/#{@song.id}" if @song
    erb :"songs/new"
  end

  patch '/songs/:id' do
    song = params[:song]
    genres = song[:genres]
    title = song[:title]
    artist_name = song[:artist]

    song = Song.find_by(id: params[:id])
    song.title = title
    song.artist = Artist.find_or_create_by(name: artist_name)
    song.genres.clear

    genres.each_with_index do |genre, i|
      g = Genre.find_or_create_by(name: genre) unless genre.empty?
      song.genres << g unless g.nil?
    end
    song.save

    redirect to "/songs/#{song.id}"
  end

  delete "/songs/:id" do
    song = Song.find_by(id: params[:id])
    song.destroy
    redirect to "/songs"
  end
end
