require 'mechanize'

class LyricsCrawler
  def initialize site
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
    @site = site
  end

  def crawl_lyrics track
    puts "Fetching #{track}"
    begin
      lyrics = crawl_lyrics_page "/lyrics/#{track.artist.slug}/#{track.slug}"
      if lyrics
        track.update lyrics: lyrics
      else
        raise 'No lyrics found'
      end
    rescue => error
      puts error
    end
  end

  def crawl_lyrics_page path
    page = @agent.get path, [], @site
    # page.search('#lyric-body-text').text


    lyrics = page.search('.lyrics-results .inner').first
    if lyrics
      lyrics.children.map { |node| node.name == 'br' ? "\n" : node.text.strip }.join
    end
  end
end
