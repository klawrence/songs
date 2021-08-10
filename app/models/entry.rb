class Entry < ApplicationRecord
  belongs_to :chart
  belongs_to :track

  def to_s
    "#{position}. #{track}"
  end
end
