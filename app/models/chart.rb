class Chart < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :entries

  scope :by_name, -> { order :name }

  # Pass in an array of entries of the form
  # ['artist name', 'track name']
  # to create the chart entries
  def create_chart_entries chart_entries
    chart_entries.each_with_index do |entry, index|
      artist = Artist.find_or_create_by name: entry[0]
      track = artist.tracks.find_or_create_by title: entry[1]
      entries.create! track: track, position: index+1
    end
  end
#  TODO What about duplicate artist names?
#  TODO What about duplicate track titles?

  def to_s
    name
  end
end
