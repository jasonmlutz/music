class TracksController < ApplicationController
  def new
    @track = Track.new
    @track_album = Album.find_by(id: params[:album_id])
    @albums = Album.all
    render :new
  end

  def create

  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end

  private

  def track_params
    params.require(:track).permit(:album_id, :title, :ord, :lyrics, :regular)
  end
end
