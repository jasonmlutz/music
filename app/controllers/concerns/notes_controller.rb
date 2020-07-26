class NotesController < ApplicationController
  def create
    note = Note.new(note_params)
    note.author_id = current_user.id
    if note.save
      redirect_to track_url(note.track_id)
    else
      redirect_to track_url(note.track_id)
    end
  end

  def update

  end

  def destroy

  end

  private

  def note_params
    params.require(:note).permit(:track_id, :body)

  end
end
