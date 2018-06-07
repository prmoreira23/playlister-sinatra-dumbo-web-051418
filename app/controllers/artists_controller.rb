

class ArtistsController < ApplicationController

get "/artists" do
  @artists = Artist.all
  erb :"artists/index"
end

get "/artists/new" do
  erb :"artists/new"
end

post "/artists" do
  artist = Artist.create(params[:artist])
  flash[:message] = "Successfully created artist."
  redirect to "/artists/#{artist.slug}"
end

get "/artists/:slug" do
  @artist = Artist.find_by_slug(params[:slug])
  erb :"artists/show"
end

get "/artists/:id/edit" do
  @artist = Artist.find_by(id: params[:id])
  @action_url = "/#{@artist.id}" if @artist
  erb :"artists/new"
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
