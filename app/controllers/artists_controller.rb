

class ArtistsController < ApplicationController

get "/artists" do
  @artists = Artist.all
  erb :"artist/index"
end

get "/artists/new" do
  erb :"artist/new"
end

post "/artists" do
  artist = Artist.create(params[:artist])
  redirect to "/artists"
end

get "/artists/:id" do
  @artist = Artist.find_by(id: params[:id])
  erb :"artist/show"
end

get "/artists/:id/edit" do
  @artist = Artist.find_by(id: params[:id])
  @action_url = "/#{@artist.id}" if @artist
  erb :"artist/new"
end

patch "/artists/:id" do

  @artist = Artist.find_by(id: params[:id])
  @artist.update(params[:artist])
  redirect to "/artists/#{@artist.id}"

end

delete "/artists/:id" do
  artist = Artist.find_by(id: params[:id])
  artist.destroy
  redirect to "/artists"
end


end
