class WordcloudsController < ApplicationController
  before_action :set_chart, except: :index

  def index
    @chart = Chart.find_by_name '1970s'
  end

  def show
    words = Hash.new 0

    @chart.entries.includes(:track).map(&:track).each do |track|
      if track.lyrics
        track.lyrics.
            downcase.
            strip.
            gsub(/\s+/m, ' ').
            gsub(/[^a-z0-9 ]/, '').
            split(' ').
            each{|word| words[word] += 1}
      end
    end

    render json: words.
        select{|word, count| word.length > 4 && count > 3 && !STOPWORDS.include?(word)}.
        map{|word, count| {text: word, value: (Math.log(count) * 10).round}}
  end

  private
  def set_chart
    @chart = Chart.find_by_name! params[:id]
  end

  STOPWORDS = Set.new(%w[
      and the with its all youll youre there cause didnt where
      theyll those theyre could
])
end
