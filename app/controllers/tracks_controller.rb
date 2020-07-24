class TracksController < ApplicationController
  def new

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
