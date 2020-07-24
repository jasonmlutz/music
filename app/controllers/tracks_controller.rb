class TracksController < ApplicationController
  def new
    @track = Track.new
    @track_album = Album.find_by(id: params[:album_id])
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(track_params)
    @track.bonus = false unless track_params[:bonus]
    if @track.save!
      redirect_to track_url(@track)
    else
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    if @track
      @track_album = Album.find_by(id: @track.album_id)
      @albums = Album.all
      render :edit
    else
      redirect_to bands_url
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
    if @track
      render :show
    else
      redirect_to bands_url
    end
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track
      @track.bonus = false unless track_params[:bonus]
      redirect_to track_url(@track) if @track.update(track_params)
    else
      render :edit
    end

  end

  def destroy
    @track = Track.find_by(id: params[:id])
    if @track
      @track.destroy
      @album = Album.find_by(id: @track.album_id)
      redirect_to album_url(@album)
    else
      redirect_to bands_url
    end
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :title, :ord, :lyrics, :bonus)
  end
end
