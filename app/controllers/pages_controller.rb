class PagesController < ApplicationController
  def home
    @charts = Chart.all.by_name.includes(entries: {track: :artist})
  end
end
