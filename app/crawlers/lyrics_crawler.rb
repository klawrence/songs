require 'mechanize'

class LyricsCrawler
  def initialize site, sitemap
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
    @site = site
    @sitemap = sitemap
  end

  def crawl_lyrics track
    puts "Fetching #{track}"
    begin
      url = "/lyrics/#{track.artist.slug}/#{track.slug}"
      unless available_tracks.include? url
        puts 'Not available'
        return
      end

      lyrics = crawl_lyrics_page url
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
      lyrics.children.map { |node| node.name.in?(['br', 'span']) ? "\n" : node.text.strip }.join
    end
  end

  def available_tracks
    return @tracks if @tracks

    doc = File.open(@sitemap) { |f| Nokogiri::XML(f) }
    @tracks = Set.new doc.css('loc').map(&:text).map{|url| url.gsub(/https:\/\/.+?\//, '/') }
  end
end
