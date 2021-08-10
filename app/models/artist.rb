class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :tracks, dependent: :destroy

  def to_s
    name
  end
end
