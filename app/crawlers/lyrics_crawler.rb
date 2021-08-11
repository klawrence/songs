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
      url = "/lyrics/#{track.artist.slug}/#{track.slug}"
      unless sitemap.include? url
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

  def sitemap
    return @sitemap if @sitemap

    doc = File.open("config/www.sitemap-lyrics.xml") { |f| Nokogiri::XML(f) }
    @sitemap = Set.new doc.css('loc').map(&:text).map{|url| url.gsub(/https:\/\/.+?\//, '/') }
  end
end
