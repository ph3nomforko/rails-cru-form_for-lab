class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        set_song
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new
        @song.name = params[:song][:name]
        @song.artist_id = params[:song][:artist_id]
        @song.genre_id = params[:song][:genre_id]
        @song.save
        redirect_to song_path(@song)
    end

    def edit
        set_song
    end

    def update
        set_song
        @song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    private

    def set_song
        @song = Song.find(params[:id])
    end
end
