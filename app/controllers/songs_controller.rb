class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find_by(params[:id])
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params(:title, :released, :release_year, :artist_name, :genre))
        redirect_to song_path(@song)
    end

    def edit
        @song = Song.find_by(params[:id])
    end

    def update
    end

    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end
end
