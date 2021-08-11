class TracksController < ApplicationController
  before_action :set_artist
  before_action :set_track, except: :index

  def show
  end

  private
  def set_artist
    @artist = Artist.friendly.find params[:artist_id]
  end

  def set_track
    @track = @artist.tracks.friendly.find params[:id]
  end
end
