class TracksController < ApplicationController
  before_action :redirect_unless_signed_in
  before_action :admin_only, except: [:show]

  def new
    @track = Track.new
    @track_album = Album.find_by(id: params[:album_id])
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(track_params)
    @track.bonus = false unless track_params[:bonus]
    if @track.save
      redirect_to track_url(@track)
    else
      @track_album = Album.find_by(id: params[:track][:album_id])
      @albums = Album.all
      flash[:errors] = @track.errors.full_messages
      redirect_to new_album_track_url(@track_album)
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    if @track
      @track_album = Album.find_by(id: @track.album_id)
      @albums = Album.all
      render :edit
    else
      flash[:errors] = ['Unable to edit -- track entry does not exist.']
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
      if @track.update(track_params)
        redirect_to track_url(@track)
      else
        flash[:errors] = @track.errors.full_messages
        redirect_to edit_track_url(@track)
      end
    else
      flash[:errors] = ['Unable to edit -- track entry does not exist.']
      redirect_to bands_url
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
