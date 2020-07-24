class AlbumsController < ApplicationController
  before_action :redirect_unless_signed_in

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

  def show
    @album = Album.find_by(id: params[:id])
    if @album
      render :show
    else
      redirect_to bands_url
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @bands = Band.all
    if @album
      @album_artist = Band.find_by(id: @album.band_id)
      render :edit
    else
      redirect_to bands_url
    end
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album && @album.update(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    if @album
      @album.destroy
      @band = Band.find_by(id: @album.band_id)
      redirect_to band_url(@band)
    else
      redirect_to bands_url
    end
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :band_id, :studio)
  end
end
