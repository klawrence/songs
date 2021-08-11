class ArtistsController < ApplicationController
  before_action :set_artist, except: :index

  def index
    @artists = Artist.by_name
  end

  def show
    @tracks = @artist.tracks.by_title
  end

  private
  def set_artist
    @artist = Artist.friendly.find params[:id]
  end
end
