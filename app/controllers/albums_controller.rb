class AlbumsController < ApplicationController
  def show
    @album = Album.find_by(id: params[:id])
    if @album
      render :show
    else
      redirect_to bands_url
    end
  end

  def new
    @album = Album.new
    @album_artist = Band.find_by(id: params[:band_id])
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save!
      redirect_to album_url(@album)
    else
      redirect_to band_url(Band.find_by(id: @album.band_id))
    end

  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :band_id)
  end
end
