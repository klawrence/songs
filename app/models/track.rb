class Track < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :artist

  def to_s
    "#{title} — #{artist}"
  end
end
