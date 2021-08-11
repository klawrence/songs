class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :tracks, dependent: :destroy

  scope :by_name, -> { order :name}

  def to_s
    name
  end
end
