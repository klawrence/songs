class ArtistsController < ApplicationController
  def index
    @artists = Artist.by_name
  end
end
