class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @note.author_id = current_user.id
    if @note.save
      redirect_to track_url(@note.track_id)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track_id)
    end
  end

  def destroy
    note = Note.find_by(id: params[:id])
    if note
      if current_user.nil? || current_user.id != note.author_id
        render text: 'you are not authorized to take that action'
      else
        note.destroy
        redirect_to track_url(note.track_id)
      end
    else
      redirect_to bands_url
    end

  end

  private

  def note_params
    params.require(:note).permit(:track_id, :body)

  end
end
