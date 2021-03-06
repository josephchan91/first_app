class SongsController < ApplicationController
  def index
    @songs = Song.all
    @songs_no_playlist = Song.no_playlist
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      Pusher['songs_channel'].trigger('song_added', {})
      redirect_to action: 'index'
    else
      render :new
    end    
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(song_params)
      redirect_to song_path(@song.id)
    else
      render 'edit'
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private

    def song_params
      params.require(:song).permit(:title, :playlist_id)
    end
end
